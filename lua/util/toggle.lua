local M = {}

-- setup toggle global vars
M.set_toggle = function(group, toggles)
  for name, toggle in pairs(toggles) do
    local key = group .. toggle.key
    vim.keymap.set("n", key, function()
      vim.g[toggle.flag] = not vim.g[toggle.flag]

      -- notify
      local status = vim.g[toggle.flag] == true and "on" or "off"
      local level = status == "on" and "info" or "warn"
      local msg = ("%s toggled %s"):format(name, status)
      LazyVim[level](msg, { title = "Option" })

      -- execute cmd if available
      if toggle.cmd then
        toggle.cmd(vim.g[toggle.flag])
      end
    end, { desc = toggle.text })
  end
end

return M
