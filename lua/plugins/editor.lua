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
    "folke/which-key.nvim",
    init = function()
      local wk = require("which-key")
      wk.add(keys.which_key.groups)
      wk.add(keys.which_key.keys)
    end,
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
    "nvim-telescope/telescope.nvim",
    keys = keys.telescope.keys,
    opts = function(_, opts)
      local ta = require("telescope.actions")
      local more_opts = {
        defaults = {
          file_ignore_patterns = editor_props.telescope.file_ignore_patterns, -- files in .gitignore files are already ignored by rg and fd. Add any additional files/dir here
          path_display = { "truncate" }, -- truncate the beginning of long file names
          mappings = {
            i = {
              ["<esc>"] = ta.close,
            },
          },
        },
        pickers = {
          find_files = {
            follow = true,
            hidden = true,
          },
          buffers = {
            ignore_current_buffer = true,
            sort_mru = true,
            mappings = keys.telescope.buffers,
          },
          diagnostics = {
            initial_mode = "normal",
          },
        },
      }
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, more_opts.defaults)
      opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, more_opts.pickers)
    end,
    dependencies = {
      "LinArcX/telescope-env.nvim",
      "nvim-telescope/telescope-symbols.nvim",
    },
    init = function()
      local extensions_list = { "env" }
      for _, ext in ipairs(extensions_list) do
        require("telescope").load_extension(ext)
      end
    end,
  },
}
