if not vim.g.lang_mdx then
  return {}
end

return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "mdx-analyzer" } },
  },
}
