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
  -- we are using { import = "lazyvim.plugins.extras.lang.markdown" } for primary markdown setup but,
  -- markdown linting is duplicated between none-ls (null-ls) and nvim-lint. Here we disable one of them
  "nvimtools/none-ls.nvim",
  init = function()
    require("null-ls").disable({ "markdownlint" })
  end,
}
