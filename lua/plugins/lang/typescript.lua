if not vim.g.lang_typescript then
  return {}
end

return {
  -- treesitter source already added by lazyvim
  {
    "garymjr/nvim-snippets",
    opts = {
      extended_filetypes = {
        typescript = { "javascript" },
      },
    },
  },
}
