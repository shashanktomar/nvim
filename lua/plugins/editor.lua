local editor_props = require("props.editor")
local ta = require("telescope.actions")
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

  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ui = {
  --       border = "single",
  --     },
  --   },
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = keys.neo_tree,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = keys.telescope,
    opts = {
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
          mappings = {
            n = {
              ["x"] = ta.delete_buffer, -- close a buffer from the list
            },
          },
        },
        diagnostics = {
          initial_mode = "normal",
        },
      },
    },
    dependencies = {
      "LinArcX/telescope-env.nvim",
    },
    init = function()
      local extensions_list = { "env" }
      for _, ext in ipairs(extensions_list) do
        require("telescope").load_extension(ext)
      end
    end,
  },
}
