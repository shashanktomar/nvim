-- these both are required to avoid adding any newlines in markdown file paragraphs
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0

vim.wo.wrap = true -- wrap at the end of screen
vim.wo.linebreak = true -- wrap at word boundaries
vim.opt.formatoptions:remove({ "t" })

vim.b.minisurround_config = {
  custom_surroundings = {
    l = {
      output = function()
        local Util = require("lazy.core.util")
        local value = vim.fn.getreg("+")
        if not value or value == "" then
          Util.warn("Register is empty", { title = "Add link" })
          return
        end
        return { left = "[", right = "](" .. value .. ")" }
      end,
    },
  },
}

vim.keymap.set("n", "<leader>il", "gsaiwl", { desc = " Insert markdown link", remap = true })
