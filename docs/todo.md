# Todos

## Basic Setup

- [x] make a choice between `NvChad` and `Lazyvim`
  - check [nvchad vs lazyvim](./nvchad-vs-lazyvim.md)
- [x] bootstrap from `lazyvim` `starter` repo
- [ ] add `.stylua.toml` and add support for it
- [ ] add `.luarc.json` and add support for it. Check `nvchad` repo for reference

## Mappings, Autocmds and Options

- [ ] compare `nvchad` and personal setup options with `lazyvim` and add if missing
- [ ] compare `nvchad` and personal autocmds with `lazyvim` and add if missing
- [ ] check `nvchad` default mappings and move them to new setup
- [ ] check my old mappings and retain whatever is required
- [ ] get familiar with `lazygit` mappings and change if required

## Plugins

### Core

- [ ] neotree setup
  - [ ] understand `lazyvim` setup
  - [ ] read the docs `:h neo-tree`
  - [ ] add thrash and undo delete support. Some help is
        [here](https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202)
  - [ ] check [recipes](https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes)
  - [ ] see [tips](https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Tips)
- [x] which-key setup
- [ ] telescope setup
  - [x] understand `lazyvim` and `nvchad` setup
  - [x] replicate existing setup
  - [ ] simplify the `lsp_document_symbols` filter for markdown files
  - [ ] revisit bindings for line, buffer and workspace diagnostics after understanding lsp bindings
  - [ ] add feature to have both file search and grep in a given dir (see example.lua)
  - [ ] check why `<C-l>` is not working in `:Telescope lsp_document_symbols` like
        [this](https://user-images.githubusercontent.com/39233597/110256294-57385c00-7f98-11eb-86e9-9f647bb2a659.mp4)
  - [ ] read the docs
  - [ ] check [showcase](https://github.com/nvim-telescope/telescope.nvim/wiki/Showcase)
  - [ ] check [extensions](https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions)
    - [x] install a native sorter
    - [ ] set dap extension
    - [ ] explore [telescope-frecency extension](https://github.com/nvim-telescope/telescope-frecency.nvim), it looks
          interesting
    - [ ] add [telescope-software-licenses](https://github.com/chip/telescope-software-licenses.nvim) extension
    - [ ] do we need [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)?
  - [ ] check [recipes](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes)
- [x] go through `mini-bufremove` setup
- [ ] `mason` setup

### Code

- lsp
  - [x] understand lsp setup for `lazyvim` and compare it with `nvchad`
  - [x] `nvim-lspconfig`
    - [x] have working knowledge (documented [here](./plugins/nvim-lspconfig.md))
    - [ ] go through the full docs and understand in depth
    - [x] setup existing language servers
      - [ ] markdown
        - [x] basic marksman setup
        - [ ] see marksman option in details [here](https://github.com/artempyanykh/marksman)
        - [ ] setup vale and markdownlint. Check
              [this](https://docs.gitlab.com/ee/development/documentation/testing.html#vale) gitlab guide
      - [ ] explore tsserver config options
  - [ ] null-ls
    - [x] replicate existing setup
    - [ ] see how to sync mason install. Check [mason-null-ls](https://github.com/jay-babu/mason-null-ls.nvim)
    - [ ] test if format on save is working
  - [ ] port old keymaps and change if required
  - [ ] read `nvim` lsp docs `:h lsp`
  - [ ] go through lsp protocol
  - [ ] add show minimal diagnostics icons toggle
- code completion
  - [ ] `nvim-cmp`
    - [ ] check the [wiki](https://github.com/hrsh7th/nvim-cmp/wiki)

### Other

- [ ] setup `lazyvim` extras plugins
- [ ] check example lua for more plugins and options

### Plugins to Explore

- [ ] all the [mini](https://github.com/echasnovski/mini.nvim) plugins
- [ ] [octo.nvim](https://github.com/pwntester/octo.nvim)
  - also check [telescope-github](https://github.com/nvim-telescope/telescope-github.nvim) cli extension
- [ ] [neoterm](https://github.com/kassio/neoterm)
- [ ] [trees](https://github.com/Wansmer/treesj)
- [ ] [easyread](https://github.com/JellyApple102/easyread.nvim)
- [ ] [vim-visual-multi](https://github.com/mg979/vim-visual-multi)

## Other Workflows

- [ ] can `nvchad` themes be ported for `lazyvim`?
- [ ] refine the `my-help` document
- [ ] understand folding in depth, try for json and yaml. Also check for plugins around the same.
- [ ] session management
- [ ] learn window management
  - check window split commands provided by lazyvim under leader key
- [ ] start using `marks`
- [ ] setup a good `registers` workflow
- [ ] learn how to use jumplist, there is also a telescope shortcut
- [ ] add case related utils, check twiddleCase at [this](https://vim.fandom.com/wiki/Switching_case_of_characters)
      fandom wiki. Also check for relevant plugins
