local M = {}

-- These are only used to enable additional config on top of what lazyvim provide or miss.
-- The language support provided by lazyvim is configured in config/lazy.lua
M.flags = {
  lang = {
    c_sharp = false,
    dev_ops = true,
    frontend = true,
    markdown = true,
    mdx = true,
    python = true,
    typescript = true,
    rust = true,
    just = true,
  },
}

return M
