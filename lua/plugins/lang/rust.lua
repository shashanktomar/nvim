if not vim.g.lang_rust then
  return {}
end

return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "rust-analyzer" } },
  },
}
