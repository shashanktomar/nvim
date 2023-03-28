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
}

return M
