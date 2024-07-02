local props = require("props.ui")
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
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
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "single",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = {
      border = "single",
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("lspconfig.ui.windows").default_options.border = "single"
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local icons = LazyVim.config.icons.kinds
          local sources = props.cmp.sources

          local get_source = function(name)
            if sources[name] then
              return sources[name]
            end

            vim.notify_once(
              ("CMP source is missing for %s, add it in props/ui.lua"):format(name),
              vim.log.levels.WARN,
              { title = "CMP source missing!" }
            )
            return "[UNKNOWN]"
          end

          if icons[item.kind] then
            item.kind = icons[item.kind]
          end

          item.menu = get_source(entry.source.name)
          return item
        end,
      },
    },
  },
}
