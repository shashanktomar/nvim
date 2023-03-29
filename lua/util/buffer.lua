local M = {}

local scratch_bufname = "scratch.out.txt"
local scratch_bufnr = -1

M.output_in_scratch_buffer = function(data)
  local buffer_visible = vim.api.nvim_call_function("bufwinnr", { scratch_bufnr }) ~= -1
  if scratch_bufnr == -1 or not buffer_visible then
    vim.api.nvim_command("botright vsplit " .. scratch_bufname)
    scratch_bufnr = vim.api.nvim_get_current_buf()
  end

  local lines = vim.split(data, "\n")
  local current_time = os.date("%Y-%m-%d %H:%M:%S")
  vim.api.nvim_buf_set_option(scratch_bufnr, "readonly", false)
  vim.api.nvim_buf_set_lines(scratch_bufnr, 0, -1, true, {}) -- clear the buffer
  vim.api.nvim_buf_set_lines(scratch_bufnr, -1, -1, true, { "Updated: " .. current_time })
  vim.api.nvim_buf_set_lines(scratch_bufnr, -1, -1, true, lines)
  vim.api.nvim_buf_set_option(scratch_bufnr, "readonly", true)
  vim.api.nvim_buf_set_option(scratch_bufnr, "modified", false)
end

return M
