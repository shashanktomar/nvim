local M = {}

M.merge_table = function(table)
  local result = {}
  for _, group in pairs(table) do
    result = vim.tbl_extend("force", result, group)
  end
  return result
end

return M
