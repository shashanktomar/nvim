if not vim.g.lang_c_sharp then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c_sharp",
      },
    },
  },
}
