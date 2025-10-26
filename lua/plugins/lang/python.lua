if not vim.g.lang_python then
  return {}
end

return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "ruff")
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
          -- Disable hover/diagnostics to prevent crashes
          -- See: https://github.com/astral-sh/ruff/issues/10661
          on_attach = function(client, bufnr)
            -- Disable hover provider to prevent range errors
            client.server_capabilities.hoverProvider = false
          end,
          keys = {
            {
              "<leader>cx",
              LazyVim.lsp.action["source.fixAll"],
              desc = "Fix all auto-fixable issues",
            },
          },
        },
        basedpyright = {
          settings = {
            basedpyright = {
              -- Use ruff for organizing imports
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                -- Ignore all files by default to let ruff handle it
                ignore = { "*" },
              },
            },
          },
        },
      },
    },
  },
}
