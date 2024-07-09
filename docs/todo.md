# Todos

## Basic Setup

- [x] make a choice between `NvChad` and `Lazyvim`
  - check [nvchad vs lazyvim](./nvchad-vs-lazyvim.md)
- [x] bootstrap from `lazyvim` `starter` repo
- [x] add `.stylua.toml` and add support for it
- [x] follow `lazyvim` pattern to structure plugins
- [x] enable lang, formatting and editing sections in extras from `lazyvim`
- [ ] add `.luarc.json` and add support for it. Check `nvchad` repo for reference. Also check why
      [lazydev.nvim](https://github.com/folke/lazydev.nvim) is disabled when this file is found
- [x] add `/after/ftplugin` to have language specific settings as in [this](https://github.com/willothy/nvim-config)
      repo
- [x] dictionary support for word under cursor
- [ ] project specific settings
- [ ] revisit my-help and set it up using markdown and [panvimdoc](https://github.com/kdheepak/panvimdoc). Folke's
      plugin generate help like this. Maybe generate is from documentation in this repo
- [ ] fix tmux shortcuts and add tmux.nvim plugin
- [ ] fix relative line numbers

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
  - [ ] open on launch, maybe using edgy plugin
  - [ ] add thrash and undo delete support. Some help is
        [here](https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202)
  - [ ] check recipes on wiki and implement useful ones
- [x] which-key setup
- [x] mini.surround
  - [x] create shortcuts for common tasks
  - [x] check treesitter support in docs
- [x] terminal workflow
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
- [ ] textobjects and highlights
  - [x] treesitter
  - [x] nvim-treesitter-textobjects
  - [x] mini.ai
    - [x] setup textobjects
    - [x] swap
    - [x] select
    - [x] move around

### Other

- check other [mini](https://github.com/echasnovski/mini.nvim) plugins

## Other Workflows

- [x] can `nvchad` themes be ported for `lazyvim`?
- [ ] reconcile old setup
  - [ ] toggles
    - [x] toggle format on save (already provided)
    - [ ] toggle relative line numbers (already provided - bug in lazyvim which is now merged but yet to be released)
    - [ ] toggle diagnostic
    - [x] toggle completion suggestions
    - [ ] toggle current line git blame
    - [ ] toggle list chars
  - [ ] autocommands
    - [x] yank highlight (already provided)
    - [x] go to last loc when opening a buffer (already provided)
    - [x] some windows to close with q (already provided)
    - [ ] do we need async formatting
  - [ ] verify the options are all set
  - [ ] verify all mappings are set
  - [ ] remaining plugins
    - [ ] verify treesitter is properly setup
      - [x] nvim-treesitter/playground (this is now bundled in nvim)
      - [x] RRethy/nvim-treesitter-endwise (don't need this)
      - [x] nvim-treesitter/nvim-treesitter-textobjects (already provided)
      - [ ] nvim-treesitter/nvim-treesitter-refactor
      - [x] nvim-treesitter/nvim-treesitter-context (already provided)
    - [ ] lspconfig
      - [ ] detect python venv
      - [ ] verify new setup is aligned
    - [ ] null-ls
      - [ ] verify setup is aligned
    - [x] toggleterm.nvim
    - [ ] mini.nvim
    - [ ] tmux.nvim
    - [ ] nvim-autopairs
    - [ ] gitsigns
    - [ ] neotest
    - [ ] dap
      - [ ] nvim-dap-ui
      - [ ] nvim-dap-virtual-text
      - [ ] nvim-dap-vscode-js
      - [ ] vscode-js-debug
    - [ ] golang
      - [ ] nvim-dap-go
      - [ ] go.nvim
      - [ ] guihua.lua
    - [ ] sqlite.lua
    - [ ] vim.startify
    - [ ] editorconfig.vim
    - [ ] verify that lspsaga alternatives are setup
    - [ ] gitsigns
    - [ ] nvim-autopairs
- [ ] add case related utils, check twiddleCase at [this](https://vim.fandom.com/wiki/Switching_case_of_characters)
      fandom wiki. Also check for relevant plugins
- [ ] check [dot files](http://www.lazyvim.org/extras/util/dot) extras in lazyvim
- [ ] [gitui](http://www.lazyvim.org/extras/util/gitui) in lazyvim?
- [ ] check lazyvim tips and tricks as per document
- [ ] go through brew install list in dotfiles and see what can be integrated with nvim
- [x] add markdown checklist toggle
