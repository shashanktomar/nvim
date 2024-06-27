local t = require("util.table")

local M = {}

local highlights = {
  cmp = {
    -- CmpBorder = { fg = "#4e4d5d" },
  },
}

M.highlights = t.merge_table(highlights)

return M
