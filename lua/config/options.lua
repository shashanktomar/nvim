-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local ui = require("props.ui")
local editor = require("props.editor")
local coding = require("props.coding")

local opt = vim.opt
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- load custom highlights
for key, value in pairs(ui.highlights) do
  vim.api.nvim_set_hl(0, key, value)
end

-- setup toggle options
for _, toggle in pairs(editor.toggles) do
  vim.g[toggle.flag] = toggle.default or false
end

-- setup flag options
for category, values in pairs(coding.flags) do
  for key, value in pairs(values) do
    vim.g[category .. "_" .. key] = value
  end
end
