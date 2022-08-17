vim.defer_fn(function()
  pcall(require, "impatient")
end, 0)

require('utils')
require('plugins')
require('keymaps')
require('options')
require('autocmd')
