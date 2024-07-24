if not vim.g.lang_markdown then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "latex",
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- only enable markdown lint if .markdownlint.jsonc file is found
          condition = function(ctx)
            return vim.fs.find({ ".markdownlint.jsonc" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
  -- we are using { import = "lazyvim.plugins.extras.lang.markdown" } for primary markdown setup but,
  -- markdown linting is duplicated between none-ls (null-ls) and nvim-lint. Here we disable one of them
  {
    "nvimtools/none-ls.nvim",
    init = function()
      require("null-ls").disable({ "markdownlint" })
    end,
  },
}
