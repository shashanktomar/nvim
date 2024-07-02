local M = {}

-- setup toggle global vars
M.set_toggle = function(group, toggles)
  for name, toggle in pairs(toggles) do
    local key = group .. toggle.key
    vim.keymap.set("n", key, function()
      vim.g[toggle.flag] = not vim.g[toggle.flag]
      local status = vim.g[toggle.flag] == true and "on" or "off"
      local level = status == "on" and vim.log.levels.INFO or vim.log.levels.WARN
      local msg = ("%s toggled %s"):format(name, status)
      vim.notify(msg, level, { title = "Option" })
    end, { desc = toggle.text })
  end
end

return M
