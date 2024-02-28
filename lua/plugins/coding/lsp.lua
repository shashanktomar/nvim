local props = require("props.coding")
local keys = require("props.keys")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
      version = false, -- last release is way too old
    },
    opts = function(_, opts)
      local ext = {
        -- servers = props.language_servers(),
        diagnostics = {
          virtual_text = {
            source = "always", -- Or "if_many"
          },
          float = {
            source = "always", -- Or "if_many"
          },
        },
        format = {
          timeout_ms = props.settings.lsp.timeout_ms, -- eslintd is not fast enough
        },
      }
      return vim.tbl_deep_extend("force", opts, ext)
    end,
    init = function()
      require("lspconfig.ui.windows").default_options.border = "single"

      local km = require("lazyvim.plugins.lsp.keymaps").get()
      vim.list_extend(km, keys.lsp)
    end,
  },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     opts.border = "single"
  --     vim.list_extend(opts.sources, props.null_ls_sources())
  --   end,
  --   keys = keys.null_ls,
  -- },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  },

  -- This act as a bridge between mason and null-ls and auto install null-ls deps using mason
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     -- "nvimtools/none-ls.nvim",
  --   },
  --   opts = {
  --     ensure_installed = {},
  --     automatic_installation = true,
  --     automatic_setup = false,
  --   },
  -- },
}
