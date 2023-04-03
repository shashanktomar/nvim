local M = {}

local highlights = {
  cmp = {
    CmpBorder = { fg = "#4e4d5d" },
  },
}

M.highlights = function()
  local result = {}
  for _, group in pairs(highlights) do
    result = vim.tbl_extend("force", result, group)
  end
  return result
end

return M
