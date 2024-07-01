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

M.dials = {
  -- The mapping from filetypes to dial groups
  -- This is copied from https://github.com/LazyVim/LazyVim/blob/73e72ee21d7673e4040bb99f4de834410219d6cb/lua/lazyvim/plugins/extras/editor/dial.lua#L101
  dials_by_ft = {
    css = "css",
    javascript = "typescript",
    javascriptreact = "typescript",
    json = "json",
    lua = "lua",
    markdown = "markdown",
    python = "python",
    sass = "css",
    scss = "css",
    typescript = "typescript",
    typescriptreact = "typescript",
  },

  -- Custom dials and their groups
  groups = function()
    local augend = require("dial.augend")
    local checklist = require("util.dials.checklist")

    return {
      markdown = {
        checklist,
      },
    }
  end,
}

M.telescope = { file_ignore_patterns = {} }

return M
