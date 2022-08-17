local autocmd = vim.api.nvim_create_autocmd

-- Disable statusline in dashboard
-- autocmd("FileType", {
--   pattern = "alpha",
--   callback = function()
--     vim.opt.laststatus = 0
--   end,
-- })

-- Disable auto commenting new lines
autocmd("BufEnter", {
  pattern = "*",
  command = ":set formatoptions-=cro",
})

