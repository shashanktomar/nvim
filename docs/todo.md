# Todos

## Basic Setup

- [x] make a choice between `NvChad` and `Lazyvim`
  - check [nvchad vs lazyvim](./nvchad-vs-lazyvim.md)
- [x] bootstrap from `lazyvim` `starter` repo
- [x] add `.stylua.toml` and add support for it
- [x] follow `lazyvim` pattern to structure plugins
- [x] enable lang, formatting and editing sections in extras from `lazyvim`
- [ ] add `.luarc.json` and add support for it. Check `nvchad` repo for reference

## Mappings, Autocmds and Options

- [ ] check lazyvim mappings
- [ ] compare `nvchad` and personal setup options with `lazyvim` and add if missing
- [ ] compare `nvchad` and personal autocmds with `lazyvim` and add if missing
- [ ] own all the mappings and consolidate `nvchad`, `lazygit` and personal mappings
- [ ] keep the mapping as close a possible to [vimium](https://github.com/philc/vimium/wiki) plugin in browser
- [ ] change default macro key
- [x] introduce toggles

## Plugins

### Core

- [ ] neotree setup
  - [ ] understand `lazyvim` setup
  - [ ] add thrash and undo delete support. Some help is
        [here](https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202)
- [ ] which-key setup
- [x] nvim-cmp setup
  - [x] change tab and supertab behaviour
  - [x] add borders
  - [x] [customise ui](https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance)
- [ ] nvim-cmp list of extensions from [here](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources)
- [ ] telescope setup
  - [x] understand `lazyvim` and `nvchad` setup
  - [x] replicate existing setup
  - [ ] add feature to have both file search and grep in a given dir (see example.lua)
  - check why `<C-l>` is not working in `:Telescope lsp_document_symbols` like
    [this](https://user-images.githubusercontent.com/39233597/110256294-57385c00-7f98-11eb-86e9-9f647bb2a659.mp4)
  - [ ] check [extensions](https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions)
    - [x] install a native sorter
    - [ ] set dap extension
    - [ ] explore [telescope-frecency extension](https://github.com/nvim-telescope/telescope-frecency.nvim), it looks
          interesting
    - [ ] do we need [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)?
- [x] `mason` setup

### Code

- lsp
  - [x] understand lsp setup for `lazyvim` and compare it with `nvchad`
  - [x] `nvim-lspconfig`
    - [x] have working knowledge (documented [here](./plugins/nvim-lspconfig.md))
    - [x] setup existing language servers
      - [ ] markdown
        - [x] basic marksman setup
        - [ ] see marksman option in details [here](https://github.com/artempyanykh/marksman)
        - [ ] setup vale and markdownlint. Check
              [this](https://docs.gitlab.com/ee/development/documentation/testing.html#vale) gitlab guide
      - [ ] typescript
        - [ ] explore tsserver config options
        - [ ] try prettierd
        - [ ] check if eslintd is enough or we need eslint lsp
        - [ ] find a way to remove duplicate diagnostic errors from both tsserver and eslint
        - [ ] see example.lua typescript setup and give
              [typescript.nvim](https://github.com/jose-elias-alvarez/typescript.nvim) a try
  - [x] null-ls
  - [ ] understand how `neoconf` and `neodev` works
  - [x] port old keymaps and change if required
  - [ ] add minimal diagnostics icons toggle
    - check `:help vim.diagnostic.config`
  - [ ] do we need async auto formatting as used in current setup
- highlights
  - [ ] treesitter

## Other Workflows

- [ ] can `nvchad` themes be ported for `lazyvim`?
- [ ] refine the `my-help` document. Maybe generate it from learnings document in this repo
- [ ] add case related utils, check twiddleCase at [this](https://vim.fandom.com/wiki/Switching_case_of_characters)
      fandom wiki. Also check for relevant plugins
- [ ] check [dot files](http://www.lazyvim.org/extras/util/dot) extras in lazyvim
- [ ] [gitui](http://www.lazyvim.org/extras/util/gitui) in lazyvim?
- [ ] check lazyvim tips and tricks as per document
- [ ] add markdown toggle,
