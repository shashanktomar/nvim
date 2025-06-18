local editor_props = require("props.editor")
local keys = require("props.keys")

return {
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      news = {
        lazyvim = true,
        neovim = true,
      },
    },
  },
  {
    "snacks.nvim",
    opts = {
      scroll = { enabled = false },
    },
  },
  {
    -- used to streamline the installation of luarocks packages directly within Neovim.
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  -- {
  --   "3rd/image.nvim",
  --   version = "1.3.0",
  --   event = "VeryLazy",
  --   dependencies = { "luarocks.nvim" },
  --   opts = {
  --     backend = "kitty",
  --     kitty_method = "normal",
  --     integrations = {
  --       markdown = {
  --         enabled = true,
  --         clear_in_insert_mode = false,
  --         download_remote_images = true,
  --         only_render_image_at_cursor = false,
  --         filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
  --       },
  --     },
  --     --- config suggested by molten.nvim
  --     max_width = 100, -- tweak to preference
  --     max_height = 12, -- ^
  --     max_height_window_percentage = math.huge, -- this is necessary for a good experience
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true,
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   },
  -- },
  {
    "folke/which-key.nvim",
    init = function()
      local wk = require("which-key")
      wk.add(keys.which_key.groups)
      wk.add(keys.which_key.keys)
    end,
    opts = {
      preset = "classic",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = keys.neo_tree,
    -- init = function()
    --   vim.cmd("Neotree show reveal=false")
    -- end,
    opts = {
      commands = {
        copy_selector = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local vals = {
            ["BASENAME"] = modify(filename, ":r"),
            ["EXTENSION"] = modify(filename, ":e"),
            ["FILENAME"] = filename,
            ["PATH (CWD)"] = modify(filepath, ":."),
            ["PATH (HOME)"] = modify(filepath, ":~"),
            ["PATH"] = filepath,
            ["URI"] = vim.uri_from_fname(filepath),
          }

          local options = vim.tbl_filter(function(val)
            return vals[val] ~= ""
          end, vim.tbl_keys(vals))
          if vim.tbl_isempty(options) then
            vim.notify("No values to copy", vim.log.levels.WARN)
            return
          end
          table.sort(options)
          vim.ui.select(options, {
            prompt = "Choose to copy to clipboard:",
            format_item = function(item)
              return ("%s: %s"):format(item, vals[item])
            end,
          }, function(choice)
            local result = vals[choice]
            if result then
              vim.notify(("Copied: `%s`"):format(result))
              vim.fn.setreg("+", result)
            end
          end)
        end,
      },
      window = {
        mappings = {
          Y = "copy_selector",
        },
      },
    },
  },

  {
    "folke/edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    cmd = { "ToggleTerm" },
    opts = {
      open_mapping = "[[<c-\\>]]",
      terminal_mappings = true,
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      float_opts = {
        border = "single",
      },
      terminals = require("props.terminals"),
    },
    keys = function()
      local terms = LazyVim.opts("toggleterm.nvim").terminals()
      local terminal_keys = keys.toggle_term.keys
      for key, value in pairs(keys.toggle_term.terminals) do
        local cmd = function()
          if not terms[value.cmd] then
            vim.notify("Terminal command '" .. value.cmd .. "' not found", vim.log.levels.WARN)
            return
          end
          local term = terms[value.cmd]()
          term:toggle()
        end
        vim.list_extend(terminal_keys, { { key, cmd, desc = value.cmd, ft = value.ft or nil } })
      end
      return terminal_keys
    end,
  },

  {
    "monaqa/dial.nvim",
    keys = keys.dial(),
    opts = function(_, opts)
      for key, value in pairs(editor_props.dials.groups()) do
        if opts.groups[key] then
          vim.list_extend(opts.groups[key], value)
        else
          opts.groups[key] = value
        end
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "tmux",
      },
    },
  },

  {
    "gbprod/yanky.nvim",
    opts = {
      system_clipboard = {
        sync_with_ring = false,
      },
      picker = {
        telescope = {
          mappings = {
            n = {
              x = require("yanky.telescope.mapping").delete(),
            },
          },
        },
      },
    },
    keys = keys.yanky,
  },

  {
    "LintaoAmons/bookmarks.nvim",
    version = "1.4.2",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "stevearc/dressing.nvim" },
    },
    opts = {
      json_db_path = vim.fs.normalize(vim.fn.stdpath("config") .. "/local-data/bookmarks.db.json"),
      signs = {
        mark = { icon = "󰃁", color = "#81c8be", line_bg = "#364f4c" },
      },
      -- treeview = {
      --         bookmark_format = function(bookmark)
      --           return bookmark.name .. " [" .. bookmark.location.project_name .. "] " .. bookmark.location.relative_path .. " : " .. bookmark.content
      --         end,
      --         keymap = {
      --           quit = { "q", "<ESC>" },
      --           refresh = "R",
      --           create_folder = "a",
      --           tree_cut = "x",
      --           tree_paste = "p",
      --           collapse = "o",
      --           delete = "d",
      --           active = "s",
      --           copy = "c",
      --         },
      --       },
    },
    keys = keys.bookmarks,
  },

  {
    "pwntester/octo.nvim",
    keys = keys.octo.keys,
    opts = {
      mappings = keys.octo.mappings,
      picker = "fzf-lua",
      default_to_projects_v2 = true,
    },
  },

  { "folke/noice.nvim", keys = keys.noice },

  {
    "ibhagwan/fzf-lua",
    lazy = false,
    keys = keys.fzf.keys,
    opts = {
      files = {
        cwd_prompt = true,
        path_shorten = 5,
        formatter = "path.filename_first",
      },
      buffers = {
        ignore_current_buffer = true,
        path_shorten = 5,
        formatter = "path.filename_first",
      },
      lsp = {
        path_shorten = 5,
        formatter = "path.filename_first",
      },
      oldfiles = {
        path_shorten = 5,
        formatter = "path.filename_first",
      },
    },
  },
  { "nvzone/volt", lazy = true },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
}
