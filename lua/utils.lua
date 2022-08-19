P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function (...)
  return require("plenary.reload").reload_module(...)
end

R = function (name)
  RELOAD(name)
  return require(name)
end

local M = {}

M.notify = function(message, level, title)
  local notify_options = {
    title = title,
    timeout = 2000,
  }
  require("notify")(message, level, notify_options)
end

return M
