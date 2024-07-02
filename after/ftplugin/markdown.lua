-- these both are required to avoid adding any newlines in markdown file paragraphs
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.wo.wrap = true -- wrap at the end of screen
vim.wo.linebreak = true -- wrap at word boundaries
vim.opt.formatoptions:remove({ "t" })
