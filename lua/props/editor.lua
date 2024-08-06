local M = {}

-- this is primarily for custom toggles. For vim toggles that involve vim options, use toggle like in
-- lazyvim https://github.com/LazyVim/LazyVim/blob/78cf6ee024cbf6a17dc8406555eb131994cd8b63/lua/lazyvim/config/keymaps.lua#L117
M.toggles = {
  CMP = { flag = "cmp_enabled", text = "Completion", default = true, key = "c" },
  Copilot = {
    flag = "copilot_enabled",
    text = "AI (Copilot)",
    default = false,
    key = "a",
    cmd = function(flag)
      if flag then
        vim.cmd("Copilot enable")
      else
        vim.cmd("Copilot disable")
      end
    end,
  },
  DiagnosticsText = {
    flag = "diagnostics_text",
    text = "Diagnostics Text",
    default = "true",
    key = "D",
    cmd = function(flag)
      -- toggle diagnostic text
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            if flag then
              return diagnostic.message
            end
            -- this is different from virtual_text = false. Setting virtual text to false
            -- disable all the diagnostic messages. This way we just disable the messages
            -- but boxes are still printed
            return ""
          end,
        },
      })
    end,
  },
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
    jsonc = "json",
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
      json = {
        augend.constant.alias.bool,
      },
    }
  end,
}

-- avoid using this as it make telescope extremely slow as per this comment https://github.com/nvim-telescope/telescope.nvim/issues/522#issuecomment-1034458495
-- .gitignore files are already ignored, for other files, use .
M.telescope = { file_ignore_patterns = {} }

return M
