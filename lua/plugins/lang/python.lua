if not vim.g.lang_python then
  return {}
end

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "ruff", "ty" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_format" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          keys = {
            {
              "<leader>cx",
              LazyVim.lsp.action["source.fixAll"],
              desc = "Fix all auto-fixable issues",
            },
          },
        },
        ty = {},
        pyright = { enabled = false },
        basedpyright = { enabled = false },
      },
    },
  },
}
