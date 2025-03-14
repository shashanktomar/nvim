if not vim.g.lang_rust then
  return {}
end

return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "rust-analyzer" } },
  },
}
