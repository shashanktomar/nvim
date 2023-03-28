# Cheatsheet

If something doesn't seem right, first thing you should do it run healthcheck for the plugin with `checkhealth <plugin-name>`. Example `checkhealth telescope`.

- telescope
  - help is `<C-/>` in `insert` mode and `?` in `normal` mode
  - check `:h telescope.setup` for available configuration
- which-key
  - use `z=` for spelling suggestions
- lsp
  - jsonls
    - if schema is not auto-detected using filename, you can add to `$schema` field as described in [nvim-lspconfig](./lsp/nvim-lspconfig.md) doc
