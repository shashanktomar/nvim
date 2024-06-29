local M = {}

M.toggles = {
  CMP = { flag = "cmp_enabled", default = true, key = "c" },
}

-- close some filetypes with <q>
M.close_with_q_filetypes = {
  "PlenaryTestPopup",
  "help",
  "lspinfo",
  "man",
  "notify",
  "qf",
  "query", -- :InspectTree
  "spectre_panel",
  "startuptime",
  "tsplayground",
  "checkhealth",
  "scratch.out",
}

M.telescope = { file_ignore_patterns = {} }

return M
