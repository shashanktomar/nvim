local M = {}

M.lsp = {

  -- From https://github.com/b0o/SchemaStore.nvim/blob/main/lua/schemastore/catalog.lua
  jsonSchemas = {
    -- nodejs
    ".eslintrc",
    "package.json",
    "prettierrc.json",
    "tsconfig.json",
    -- aws
    "AWS CloudFormation",
    "AWS CloudFormation Serverless Application Model (SAM)",
    -- github
    "GitHub Action",
    "GitHub Issue Template configuration",
    "GitHub Workflow Template Properties",
    "GitHub Workflow",
    "GitHub issue forms",
    -- other
    "Buildkite",
  },

  servers = {
    -- for lua_ls config, check folke's dotfile setup https://github.com/folke/dot/blob/master/nvim/lua/plugins/lsp.lua
    -- 'eslint',
    tsserver = {}, -- TODO: Check config in depth https://github.com/typescript-language-server/typescript-language-server
    bashls = {},
    dockerls = {},
    pyright = {},
    gopls = {},
    marksman = {}, -- TODO: Check config in depth https://github.com/artempyanykh/marksman
    html = {},
    cssls = {},

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
}

return M
