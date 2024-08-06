local icons = require("props.ui").icons.which_key.custom_icons

local M = {}

local toggle_fn = function(toggle)
  return function()
    vim.g[toggle.flag] = not vim.g[toggle.flag]

    -- notify
    local status = vim.g[toggle.flag] == true and "on" or "off"
    local level = status == "on" and "info" or "warn"
    local msg = ("%s toggled %s"):format(toggle.text, status)
    LazyVim[level](msg, { title = "Option" })

    -- execute cmd if available
    if toggle.cmd then
      toggle.cmd(vim.g[toggle.flag])
    end
  end
end

-- setup toggle global vars
M.set_toggle = function(group, toggles)
  for _, toggle in pairs(toggles) do
    local wk = require("which-key")
    local key = group .. toggle.key
    wk.add({
      {
        key,
        toggle_fn(toggle),
        mode = "n",
        icon = function()
          return vim.g[toggle.flag] == true and icons.enabled or icons.disabled
        end,
        desc = function()
          return (vim.g[toggle.flag] == true and "Disable " or "Enable ") .. toggle.text
        end,
      },
    })
  end
end

return M
