if not vim.g.lang_dev_ops then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- "bash", -- already added by lazyvim
        -- "dockerfile", -- already added by lazyvim
        "make",
      },
    },
  },
}
