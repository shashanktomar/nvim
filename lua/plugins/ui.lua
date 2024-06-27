return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    -- "shashanktomar/themes.nvim",
    -- -- dev = true,
    -- cmd = "Themes",
    -- config = function()
    --   require("themes").setup({
    --     theme = "chadracula",
    --   })
    -- end,
    -- lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- keys = keys.telescope,
    opts = {
      defaults = {
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
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        separator = "  ", -- symbol used between a key and it's label
      },
      layout = {
        spacing = 6, -- spacing between columns
      },
      window = {
        border = "single",
      },
    },
  },
}
