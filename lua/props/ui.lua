local t = require("util.table")

local M = {}

local highlights = {
  cmp = {
    -- CmpBorder = { fg = "#4e4d5d" }
  },
}

M.highlights = t.merge_table(highlights)

M.cmp = {
  sources = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    latex_symbols = "[LaTeX]",
    snippets = "[Snippet]",
    cmdline = "[CMD]",
    path = "[Path]",
    copilot = "[Copilot]",
    ["copilot-chat"] = "[Copilot Chat]",
    emoji = "[Emoji]",
  },
}

M.icons = {
  -- valid colors are: azure, blue, cyan, green, grey, orange, purple, red, yellow
  -- valid categories are: file, filetype, extension
  which_key = {
    custom_icons = {
      line_up = {
        icon = "󰞕",
        color = "yellow",
      },
      line_down = {
        icon = "󰞒",
        color = "yellow",
      },
      system = {
        icon = "",
        color = "cyan",
      },
      dict = {
        icon = "󰀬",
        color = "cyan",
      },
      enabled = { icon = " ", color = "green" },
      disabled = { icon = " ", color = "yellow" },
    },
    rules = {
      { pattern = "beginning", icon = "󰞓 ", color = "cyan" },
      { pattern = "bookmark", icon = " ", color = "cyan" },
      { pattern = "end", icon = "󰞔 ", color = "cyan" },
      { pattern = "up", icon = " ", color = "cyan" },
      { pattern = "down", icon = " ", color = "cyan" },
      { pattern = "left", icon = " ", color = "cyan" },
      { pattern = "right", icon = " ", color = "cyan" },
      { pattern = "next", icon = "󰒭 ", color = "cyan" },
      { pattern = "perv", icon = "󰒮 ", color = "cyan" },
      { pattern = "surround", icon = "󰡎 ", color = "cyan" },
      { pattern = "insert", icon = " ", color = "yellow" },
      { pattern = "move", icon = " ", color = "yellow" },
      { pattern = "change", icon = " ", color = "yellow" },
      { pattern = "delete", icon = "󰗨 ", color = "yellow" },
      { pattern = "increment", icon = " ", color = "yellow" },
      { pattern = "decrement", icon = " ", color = "yellow" },
      { pattern = "info", icon = " ", color = "cyan" },
      { pattern = "fold", icon = " ", color = "cyan" },
      { pattern = "goto", icon = "󱞿 ", color = "cyan" },
    },
  },
}

return M
