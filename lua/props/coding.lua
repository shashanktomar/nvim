local M = {}

M.settings = {
  lsp = {
    timeout_ms = 5000,
  },
  snippets = {
    path = "./snippets",
  },
}

local language_props = function()
  local ok, null_ls = pcall(require, "null-ls")
  if not ok then
    return
  end
  local code_actions = null_ls.builtins.code_actions
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  -- local completion = null_ls.builtins.completion

  return {
    frontend = {
      lsp_servers = {
        html = {},
        cssls = {},
      },
    },
    markdown_and_text = {
      lsp_servers = {
        marksman = {}, -- TODO: Check config in depth https://github.com/artempyanykh/marksman
      },
      diagnostics = {
        -- diagnostics.vale,
        diagnostics.markdownlint,
        diagnostics.misspell,
      },
      formatting = { -- prettier is the best option for formatting markdown
      },
    },
    scripting = {
      lsp_servers = {
        bashls = {},
        dockerls = {},
      },
      code_actions = {
        code_actions.shellcheck,
      },
      formatting = {
        formatting.shfmt,
      },
      diagnostics = {
        diagnostics.shellcheck,
      },
    },
    other = {
      -- code_actions.gitsigns,
    },
    config = {
      lsp_servers = {
        jsonls = {
          settings = {
            json = {
              format = { enable = false }, -- let null-ls handle the formatting
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              format = { enable = false }, -- let null-ls handle the formatting
              completion = true,
              hover = true,
              validate = true,
            },
          },
        },
      },
      schemas = {},
    },
  }
end

local function addSchemas(servers)
  local schemas = language_props().config.schemas
  local settings = {
    jsonls = {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas({
            select = schemas,
          }),
          validate = { enable = true },
        },
      },
    },
    yamlls = {
      settings = {
        yaml = {
          schemas = require("schemastore").yaml.schemas({
            select = schemas,
          }),
        },
      },
    },
  }
  return vim.tbl_deep_extend("force", servers or {}, settings)
end

M.language_servers = function()
  local props = language_props()
  local lsp_servers = {}
  for _, lng in pairs(props) do
    if lng.lsp_servers then
      lsp_servers = vim.tbl_extend("force", lsp_servers, lng.lsp_servers)
    end
  end
  return addSchemas(lsp_servers)
end

M.null_ls_sources = function()
  local props = language_props()
  local sources = {}
  for _, lng in pairs(props) do
    if lng.code_actions then
      vim.list_extend(sources, lng.code_actions)
    end
    if lng.formatting then
      vim.list_extend(sources, lng.formatting)
    end
    if lng.diagnostics then
      vim.list_extend(sources, lng.diagnostics)
    end
    if lng.completion then
      vim.list_extend(sources, lng.completion)
    end
  end
  return sources
end

return M
