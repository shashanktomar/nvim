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
- [ ] own all the mappings and consolidate `nvchad`, `lazygit` and personal mappings

## Plugins

### Core

- [ ] neotree setup
  - [ ] understand `lazyvim` setup
  - [ ] add thrash and undo delete support. Some help is
        [here](https://github.com/nvim-neo-tree/neo-tree.nvim/issues/202)
- [x] which-key setup
- [ ] telescope setup
  - [x] understand `lazyvim` and `nvchad` setup
  - [x] replicate existing setup
  - [ ] simplify the `lsp_document_symbols` filter for markdown files
  - [ ] revisit bindings for line, buffer and workspace diagnostics after understanding lsp bindings
  - [ ] add feature to have both file search and grep in a given dir (see example.lua)
  - [ ] check why `<C-l>` is not working in `:Telescope lsp_document_symbols` like
        [this](https://user-images.githubusercontent.com/39233597/110256294-57385c00-7f98-11eb-86e9-9f647bb2a659.mp4)
  - [ ] check [extensions](https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions)
    - [x] install a native sorter
    - [ ] set dap extension
    - [ ] explore [telescope-frecency extension](https://github.com/nvim-telescope/telescope-frecency.nvim), it looks
          interesting
    - [ ] add [telescope-software-licenses](https://github.com/chip/telescope-software-licenses.nvim) extension
    - [ ] do we need [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)?
- [x] go through `mini-bufremove` setup
- [x] `mason` setup

### Code

- lsp
  - [x] understand lsp setup for `lazyvim` and compare it with `nvchad`
  - [x] `nvim-lspconfig`
    - [x] have working knowledge (documented [here](./plugins/nvim-lspconfig.md))
    - [ ] setup existing language servers
      - [ ] markdown
        - [x] basic marksman setup
        - [ ] see marksman option in details [here](https://github.com/artempyanykh/marksman)
        - [ ] setup vale and markdownlint. Check
              [this](https://docs.gitlab.com/ee/development/documentation/testing.html#vale) gitlab guide
      - [ ] typescript
        - [ ] explore tsserver config options
        - [x] try prettierd
        - [x] check if eslintd is enough or we need eslint lsp
        - [ ] find a way to remove duplicate diagnostic errors from both tsserver and eslint
        - [ ] see example.lua typescript setup and give
              [typescript.nvim](https://github.com/jose-elias-alvarez/typescript.nvim) a try
  - [x] null-ls
  - [ ] understand how `neoconf` and `neodev` works
  - [x] port old keymaps and change if required
  - [ ] add minimal diagnostics icons toggle
  - [ ] do we need async auto formatting as used in current setup
- code completion
  - [x] `lua-snip` setup
  - [ ] `nvim-cmp`
    - [ ] replicate existing setup
- highlights
  - [ ] treesitter

### UI

- [ ] add borders to mason, lsp and null windows
  - [x] for mason
  - [ ] for null-ls
    - [x] add border
    - [ ] set border highlight
  - [x] for lspinfo
- [ ] notify keep popping up way too much

### Other

- [ ] setup `lazyvim` extras plugins
- [ ] check `example.lua` for more plugins and options

### Plugins to Explore

- [ ] all the [mini](https://github.com/echasnovski/mini.nvim) plugins
- [ ] [octo.nvim](https://github.com/pwntester/octo.nvim)
  - also check [telescope-github](https://github.com/nvim-telescope/telescope-github.nvim) cli extension
- [ ] [neoterm](https://github.com/kassio/neoterm)
- [ ] [trees](https://github.com/Wansmer/treesj)
- [ ] [easyread](https://github.com/JellyApple102/easyread.nvim)
- [ ] [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [ ] check [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) list.
      [This](https://www.trackawesomelist.com/2023/12/) is a nice changelog for the same list
- [ ] [navbuddy](https://github.com/SmiteshP/nvim-navbuddy)
- [ ] [deadcolumn](https://github.com/Bekaboo/deadcolumn.nvim)

## Other Workflows

- [ ] can `nvchad` themes be ported for `lazyvim`?
- [ ] refine the `my-help` document
- [ ] add case related utils, check twiddleCase at [this](https://vim.fandom.com/wiki/Switching_case_of_characters)
      fandom wiki. Also check for relevant plugins
