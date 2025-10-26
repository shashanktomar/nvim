if not vim.g.lang_mdx then
  return {}
end

return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "mdx-analyzer" } },
  },
}
