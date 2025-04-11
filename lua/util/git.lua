local M = {}

M.gh_browse_current_position = function()
  -- Get the current file path relative to the Git repo root
  local filepath = vim.fn.expand("%:p") -- Absolute path of the current file
  local git_root = vim.fn.system("git rev-parse --show-toplevel"):gsub("%s+", "")
  local relative_path = filepath:sub(#git_root + 2)

  -- Get the current line number
  local line_number = vim.fn.line(".")

  -- Get the current git branch
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("%s+", "")

  -- Construct the gh command
  local cmd = string.format("gh browse %s:%d --branch %s", relative_path, line_number, branch)

  -- Execute the gh command
  vim.fn.system(cmd)
end

M.get_default_branch_name = function()
  local res = vim.system({ "git", "rev-parse", "--verify", "main" }, { capture_output = true }):wait()
  return res.code == 0 and "main" or "master"
end

return M
