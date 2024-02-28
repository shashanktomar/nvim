# nvim-lspconfig

Most of the information here is from `:h lspconfig`

This plugin provides four primary functionalities:

- default launch commands, initialization options, and settings for each lsp server
- a root directory resolver which attempts to detect the root of your project
- an autocommand mapping that either launches a new language server or attempts to attach a language server to each
  opened buffer if it falls under a tracked project
- utility commands such as LspInfo, LspStart, LspStop, and LspRestart for managing language server instances

Things to note:

- for each language server, you have to invoke the setup like `require(lspconfig).python.setup{}`
  - the purpose of `setup{}` is to wrap the call to Nvim's built-in `vim.lsp.start_client()` with an autocommand that
    automatically launch a language server.
  - all `config` elements described in `:help vim.lsp.start_client()` can additionally be overridden via the `setup {}`
    call. The most commonly passed overrides to `setup {}` are:
    - `capabilities`: a table which represents the neovim client capabilities. Useful for broadcasting to the server
    additional functionality (snippets, off-protocol features) provided by plugins.
    - `on_attach`: Callback invoked by Nvim's built-in client when attaching a buffer to a language server. Often used to
    set Nvim (buffer or global) options or to override the Nvim client properties (`resolved_capabilities`) after a
    language server attaches. Most commonly used for settings buffer local keybindings.
- all the available servers are listed under `:h lspconfig-all`

There is a lot to understand about this plugin. Go through the `:h lspconfig` docs for more details

## Useful Links

- [UI Customization](https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization)

## Lazyvim setup

### Code Walkthrough

- all the `lazyvim` setup is done under `config` function
- autoformatting is attached on `LspAttach` autocommand on a buffer
  - there is a autoformat toggle
  - if no format capabilities are provided by lsp server than nothing happens
  - if toggle is `true`, all buffers are formatted on `BufWritePre` event using `null-ls`
- keybindings are attached on `LspAttach` autocommand on a buffer
  - some keybindings are attached based on the capability
- diagnostics are setup
  - diagnostics icons are setup
  - `vim.diagnostic.config(opts.diagnostics)` is called
- language server setup
  - a language server setup function is created
    - from `opts.server` list, server options are merged with `cmp-nvim-lsp` capabilities
    - it calls `require("lspconfig")[server].setup(server_opts)` conditionally
  - for all the servers which `mason-lspconfig` support, this server is added to `ensure_installed` list
  - for other, the setup method is directly called

### Extending the setup

- There are two ways of adding a new server
  - add a server to `opts.servers` list with settings under it. `lazyvim` does two things for you:
    - it will invoke `require(lspconfig).<server>.setup()` for you with the provided settings. Capabilities from
      `null-ls` are also added to the settings
    - it will install the server using `mason-lspconfig` if possible
  - add the server to `opts.setup` list with a custom setup method. This gives you freedom to run your own setup

## Language servers

- jsonls
  - it uses [vscode-json-languageserver](https://www.npmjs.com/package/vscode-json-languageserver)
  - support both `json` and `jsonc` files
  - there are two ways of defining schema for a file
    - you can bind schema urls to file patterns while setting up the `jsonls`. This is handy for json files which have
      predictable names like `package.json`
      - [b0o/schemastore.nvim](https://github.com/b0o/SchemaStore.nvim) already provide most of these bindings
    - you can use [schemastore](https://www.schemastore.org/json/) to find schemas and add to your `$schema` field in
      json file. Use this if the json filename is not defined in
      [schemastore catalog](https://github.com/b0o/SchemaStore.nvim/blob/main/lua/schemastore/catalog.lua)
- yamlls
  - it uses [yaml-language-server](https://github.com/redhat-developer/yaml-language-server) which support `jsonschema`
  - there are two ways of defining schema for a file
    - you can associate schema urls to file patterns while setting up `yamlls` as explained
      [here](https://github.com/redhat-developer/yaml-language-server). This is handy for yaml files which have
      predictable names like `*.k8s.yaml`.
      - [b0o/schemastore.nvim](https://github.com/b0o/SchemaStore.nvim) already provide most of these bindings
    - you can use [schemastore](https://www.schemastore.org/json/) to find schemas and add to your `yaml` like
      - `# yaml-language-server: $schema=<urlToTheSchema>`
      - `# yaml-language-server: $schema=../relative/path/to/schema`
      - `# yaml-language-server: $schema=/absolute/path/to/schema`
