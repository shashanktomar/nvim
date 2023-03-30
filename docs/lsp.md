# LSP Setup

This document try to capture how the lsp works under the hood and why so many plugins are required for it.

## LSP Workflow

- `nvim` supports lsp protocol out of the box.
  - this means it act as a LSP client.
  - check `:h lsp`
- to configure `lsp` for a language, multiple steps are required. You have to:
  - install the lsp server on local machine - **provided by `mason`**
  - launching a language server when a matching filetype is detected - **provided by `nvim-lspconfig`**
  - send the correct initialization options and settings (these are two separate things in the LSP specification) during
    launch - **provided by `nvim-lspconfig`**
  - attaching new buffers you open to the currently active language server - **provided by `nvim-lspconfig`**

## Lsp plugins

- [nvim-lspconfig](./plugins/nvim-lspconfig.md)
- `mason` used as described above
- `mason-lspconfig.nvim` closes some gaps that exist between `mason.nvim` and `nvim-lspconfig`. Its main
  responsibilities are to:
  - register a setup hook with lspconfig that ensures servers installed with mason.nvim are set up with the necessary
    configuration
  - provide extra convenience APIs such as the :LspInstall command
  - allow you to (i) automatically install, and (ii) automatically set up a predefined list of servers
  - translate between lspconfig server names and mason.nvim package names (e.g. lua_ls <-> lua-language-server)
  - see `:h mason-lspconfig`
- `nvim-cmp`
  - act as a language server and provide code completion from different sources like `git`, `snippets`,
    `filesystem-paths` etc.
  - `cmp-nvim-lsp`
    - it is one of the sources for `nvim-cmp` but not sure what it does

## Other LSP Plugins

- plugins that extend the features of builtin lsp client in `nvim`
  - [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) for java
  - [nvim-metals](https://github.com/scalameta/nvim-metals) for scala
