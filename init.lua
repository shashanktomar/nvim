-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("util.globals")

-- from folke's config
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    pcall(require, "config.env") -- config/env.lua is gitignored. It is used to store env related stuff
    require("util").version()
  end,
})
