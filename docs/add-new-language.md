# Add A New language

## New language

- add lsp, formatting and diagnostics support
  - find the language server. You can check `:h lspconfig-all` or
    [this](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) doc
  - add the language server to the lsp list in `props/coding.lua` file. If you need a custom setup for the lsp, check
    `Extending the setup` section in [lspconfig](./plugins/nvim-lspconfig.md) doc

## JSON or Yaml Schema

- search the schema name in the catalog
  [here](https://github.com/b0o/SchemaStore.nvim/blob/main/lua/schemastore/catalog.lua)
- if found add it to `schema` list under `props/coding.luq`
- if not found, you can use [schemastore](https://www.schemastore.org/json/) to find schemas and add to your `json` or
  `yaml` file as explained [here](./plugins/nvim-lspconfig.md)
