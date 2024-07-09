local t = require("util.table")

local M = {}

local highlights = {
  cmp = {
    -- CmpBorder = { fg = "#4e4d5d" },
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
  },
}

return M
