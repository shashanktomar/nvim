local config = require("props.coding")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    opts = {
      servers = {
        jsonls = {
          settings = {
            json = {
              format = { enable = false }, -- let null-ls handle the formatting
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              format = { enable = false }, -- let null-ls handle the formatting
              completion = true,
              hover = true,
              validate = true,
            },
          },
        },
      },
    },
  },

  -- neovim/nvim-lspconfig special setup overrides
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    opts = {
      setup = {
        -- need to do it here as `require('schemastore') is not loaded before opts.servers is parsed`
        jsonls = function(_, opts)
          local settings = {
            json = {
              schemas = require("schemastore").json.schemas({
                select = config.lsp.jsonSchemas,
              }),
              validate = { enable = true },
            },
          }
          opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, settings)
        end,
        yamlls = function(_, opts)
          local settings = {
            yaml = {
              schemas = require("schemastore").yaml.schemas({
                select = config.lsp.jsonSchemas,
              }),
            },
          }
          opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, settings)
        end,
      },
    },
  },
}
