local editor_props = require("props.editor")
local keys = require("props.keys")

return {
  {
    "LazyVim/LazyVim",
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
      wk.register(keys.which_key.groups)
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = keys.neo_tree,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    cmd = { "ToggleTerm" },
    opts = {
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
    "nvim-telescope/telescope.nvim",
    keys = keys.telescope,
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
            mappings = {},
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
