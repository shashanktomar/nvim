-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("util.globals")

-- from folke's config
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.env")
    require("util").version()
  end,
})
