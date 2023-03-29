local props = require("props.coding")
local keys = require("props.keys")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/schemastore.nvim",
    },
    opts = function(_, opts)
      local ext = {
        servers = props.language_servers(),
      }
      return vim.tbl_deep_extend("force", opts, ext)
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.sources, props.null_ls_sources())
      opts.debug = true
    end,
    keys = keys.null_ls,
  },

  -- This act as a bridge between mason and null-ls and auto install null-ls deps using mason
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {},
        automatic_installation = true,
        automatic_setup = false,
      })
    end,
  },
}
