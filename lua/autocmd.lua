local autocmd = vim.api.nvim_create_autocmd
local createGroup = vim.api.nvim_create_augroup

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

-- Close nvim if NvimTree is only running buffer
autocmd(
  "BufEnter",
  { command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]] }
)

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = createGroup("YankHighlight", { clear = true }),
})

-- Go to last loc when opening a buffer
autocmd(
  "BufReadPost",
  { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- Windows to close with "q"
autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lspinfo", "fugitive", "null-ls-info" },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})
autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Enable spell checking for certain file types
autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
