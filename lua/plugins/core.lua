local ta = require("telescope.actions")
local config = require("props.core")

return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        separator = "  ", -- symbol used between a key and it's label
      },
      layout = {
        spacing = 6, -- spacing between columns
      },
    },
    init = function()
      local wk = require("which-key")
      wk.register(config["which-key"].groups)
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = config.telescope.keys,
    opts = {
      defaults = {
        vimgrep_arguments = { -- add -L options which make rg follow symlinks
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        layout_config = { -- make telescope windows a bit wider
          horizontal = {
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        file_ignore_patterns = {}, -- files in .gitignore files are already ignored by rg and fd. Add any additional files/dir here
        path_display = { "truncate" }, -- truncate the beginning of long file names
        mappings = {
          i = {
            ["<esc>"] = ta.close,
          },
        },
      },
      pickers = {
        find_files = {
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
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      "nvim-telescope/telescope-symbols.nvim",
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
