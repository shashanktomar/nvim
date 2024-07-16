# Plugins

## In Use

### Coding

- [lsp](./lsp.md) and code completion
  - [nvim-lspconfig](./plugins/nvim-lspconfig.md): manage the lifecycle of language-servers
  - [mason](https://github.com/williamboman/mason.nvim): LSP servers, DAP servers, linters, and formatters
  - [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim): closes some gaps that exist between
    `mason.nvim` and `nvim-lspconfig`.
  - [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim): a null-ls fork. null-ls expose other tools which does not
    have an lsp implementations as lsp. Example prettier, eslint etc.
  - [SchemaStore](https://github.com/b0o/SchemaStore.nvim): json and yaml schemastore plugin
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): a completion suggestion plugin
    - [cmp-buffer](https://github.com/hrsh7th/cmp-buffer): buffer words as suggestion
    - [cmp-paths](https://github.com/hrsh7th/cmp-path): provide file system paths in completion
    - [lazydev.nvim](https://github.com/folke/lazydev.nvim?tab=readme-ov-file): has something to do with lua language
      server
- formatting and linting
  - [conform.nvim](https://github.com/stevearc/conform.nvim): formatter
  - [nvim-lint](https://github.com/mfussenegger/nvim-lint): linter. This sometime conflict with none-ls.nvim. Prefer
    this over that
- snippets
  - [nvim-snippets](https://github.com/garymjr/nvim-snippets): allow vscode style snippets to be used with nvim snippets
  - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): a collection of snippets
- llm
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
    - [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)
    - [copilot-cmp](https://github.com/zbirenbaum/copilot-cmp)
- syntax tree and text objects
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): syntax-tree builder
  - [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects): Syntax aware
    text-objects, select, move, swap, and peek support
  - [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): use treesitter to autoclose and autorename html tag
  - [mini.pairs](https://github.com/echasnovski/mini.pairs): auto pairs (close the paired brackets by default)
  - [mini.ai](https://github.com/echasnovski/mini.ai): better text objects
- [ts-comments.nvim](https://github.com/folke/ts-comments.nvim): plugin to enhance Neovim's native comments
- [Luvit-Meta](https://github.com/Bilal2453/luvit-meta): has something to do with luvit lua framework
- language
  - markdown
    - [mkdnflow](https://github.com/jakewvincent/mkdnflow.nvim)

### Git

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim): git signs highlights text that has changed since the list
  git commit, and also lets you interactively stage & unstage hunks in a commit

### Colorscheme

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [catppuccin](https://github.com/catppuccin/nvim)

### Editor

- [telescope](./plugins/telescope.md): picker
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim): file system explorer
- [nvim-spectre](https://github.com/nvim-pack/nvim-spectre): search/replace in multiple files
- [flash.nvim](https://github.com/folke/flash.nvim?tab=readme-ov-file): show labels at the end of each match, letting
  you quickly jump to a specific location.
- [which-key.nvim](https://github.com/folke/which-key.nvim): keybindings help
- [trouble.nvim](https://github.com/folke/trouble.nvim): better diagnostics list and others
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim): Finds and lists all of the TODO, HACK, BUG, etc
  comment in your project and loads them into a browsable list.
- [persistence.nvim](https://github.com/folke/persistence.nvim): session management
- [dressing.nvim](https://github.com/stevearc/dressing.nvim): better vim.ui with telescope
- [mini.surround](https://github.com/echasnovski/mini.surround): surround actions
- [yanky.nvim](https://github.com/gbprod/yanky.nvim): improved yank
- [toggleterm](https://github.com/akinsho/toggleterm.nvim): terminals

### UI

- [nvim-notify](https://github.com/rcarriga/nvim-notify): notification manager
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim): tab manager
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): status line manager
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim): indent guides for Neovim
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope): Active indent guide and indent text objects. When
  you're browsing code, this highlights the current level of indentation, and animates the highlighting.
- [noice.nvim](https://github.com/folke/noice.nvim): Highly experimental plugin that completely replaces the UI for
  messages, cmdline and the popupmenu
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): icons
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim): ui components
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim): dashboard
- [edgy.nvim](https://github.com/folke/edgy.nvim): A Neovim plugin to easily create and manage predefined window
  layouts, bringing a new edge to your workflow.

### Utils

- [dial.nvim](https://github.com/monaqa/dial.nvim): Extended increment/decrement plugin for Neovim

### Libraries

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim): library used by other plugins

## To Try

- \* means that it is supported in lazyvim extras

### Coding

- lsp and code completion
  - ~~[lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim/tree/v3.x): simplify the nvim-lspconfig and nvim-cmp
    setup~~
    - maybe not, check [this](https://github.com/LazyVim/LazyVim/issues/2428) issue
  - nvim-cmp extensions
    - [cmp-rg](https://github.com/lukas-reineke/cmp-rg): project words using ripgrep
    - [vim-dadbod-completion](https://github.com/kristijanhusak/vim-dadbod-completion): database tables using vim-dadbod
    - [cmp-nerdfont](https://github.com/chrisgrieser/cmp-nerdfont): nerdfont icons
    - check AI related completion plugins [here](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources#ai)
    - css colors and font [extensions](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources#css-colors-and-font)
    - [cmp-npm](https://github.com/David-Kunz/cmp-npm): npm packages cmp
    - [cmp-git](https://github.com/petertriho/cmp-git): Git commits, github/gitlab issues, merge/pull requests,
      mentions, etc.
    - [cmp-tmux](https://github.com/andersevenrud/cmp-tmux)
    - [cmp-dictionary](https://github.com/uga-rosa/cmp-dictionary)
    - note-taking and academic writin plugins
      [here](https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources#note-taking-and-academic-writing)
    - [cmp-look](https://github.com/octaltree/cmp-look)
    - [cmp-sql](https://github.com/ray-x/cmp-sql): source for sql keywords
    - [nvim-cmp-lua](https://github.com/hrsh7th/cmp-nvim-lua): source for neovim Lua API.
    - [otter.nvim](https://github.com/jmbuhr/otter.nvim): completion for injected languages based on synced buffers
    - [cmp-dotenv](https://github.com/SergioRibera/cmp-dotenv)
    - [cmp-dynamic](https://github.com/uga-rosa/cmp-dynamic): dynamically generate candidates using Lua functions.
- formatting
  - \*[conform.nvim](https://github.com/stevearc/conform.nvim): Lightweight yet powerful formatter plugin for Neovim
- llm tools
  - \*[codeium.nvim](https://github.com/Exafunction/codeium.nvim)
  - \*[tabnine-nvim](https://github.com/codota/tabnine-nvim)
    - \*[cmp-tabnine](https://github.com/tzachar/cmp-tabnine)
- snippets
  - \*[luasnip](https://github.com/L3MON4D3/LuaSnip): does this provide anything over nvim-snippets?
- comments
  - \*[mini.comment](https://github.com/echasnovski/mini.comment): does this provide anything over ts-comments?
  - \*[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring): use treesitter to
    find the type of comments. Useful for `tsx` files
  - \*[Neogen](https://github.com/danymat/neogen): code annotation toolkit
- syntax tree and text objects
  - \*[vim-illuminate](https://github.com/RRethy/vim-illuminate): highlight other uses of the word
- testing
  - \*[neotest](https://github.com/nvim-neotest/neotest): A framework for interacting with tests within NeoVim.
- debugging
  - \*[nvim-dap](https://github.com/mfussenegger/nvim-dap): Debug Adaptor Protocol client implementation for nvim
  - \*[nvim-dap-ui](nvim-dap-ui)
  - \*[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)
  - \*[mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim): closes some gaps that exist between
    mason.nvim and nvim-dap
  - \*[one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind): a DAP adapter for the Neovim
    lua language
- outline
  - \*[aerial.nvim](https://github.com/stevearc/aerial.nvim?tab=readme-ov-file): A code outline window for skimming and
    quick navigation
  - \*[outline.nvim](https://github.com/hedyhli/outline.nvim): Code outline
- refactoring
  - \*[inc-rename](https://github.com/smjonas/inc-rename.nvim): renaming
  - \*[refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim): The Refactoring library based off the
    Refactoring book by Martin Fowler
  - [treeSJ](https://github.com/Wansmer/treesj)
- other
  - check lspsaga
  - check [glance](https://github.com/DNLHC/glance.nvim)

### Git

- \*[octo.nvim](https://github.com/pwntester/octo.nvim): Edit and review GitHub issues and pull requests from the
  comfort of your favorite editor
  - also check [telescope-github](https://github.com/nvim-telescope/telescope-github.nvim) cli extension

### Editor

- \*[nvim-navic](https://github.com/SmiteshP/nvim-navic?tab=readme-ov-file): This shows where in the code structure you
  are - within functions, classes, etc - in the statusline.
- telescope
  - \*[telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim): FZF sorter for telescope
    written in c
  - try [telescope file-explorer](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- movement:
  - \*[leap](https://github.com/ggandor/leap.nvim): jump to locations
  - \*[flit.nvim](https://github.com/ggandor/flit.nvim): f/F/t/T motions on steroids, building on the Leap interface.
  - \*[mini.move](https://github.com/echasnovski/mini.move): Move any selection in any direction
- \*[fzf.lua](https://github.com/ibhagwan/fzf-lua)
- diff
  - \*[mini.diff](https://github.com/echasnovski/mini.diff): Work with diff hunks
- \*[neoconf.nvim](https://github.com/folke/neoconf.nvim): neoconf.nvim is a Neovim plugin to manage global and
  project-local settings.
- \*[project.nvim](https://github.com/ahmedkhalf/project.nvim): project management
- llm tools
  - try [gp.nvim](https://github.com/Robitx/gp.nvim/), it is praised on reddit for its features
  - try [chatgpt.nvim](https://github.com/jackMort/ChatGPT.nvim)
  - try mods on terminal and see if its a better workflow

### UI

- \*[alpha.nvim](https://github.com/goolord/alpha-nvim): fast and fully programmable greeter for neovim.
- \*[mini.starter](https://github.com/echasnovski/mini.starter): Fast and flexible start screen
- \*[mini.animate](https://github.com/echasnovski/mini.animate): animations
- \*[nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context): sticky code context line

### Utils

- \*[harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
- \*[vim-repeat](https://github.com/tpope/vim-repeat): makes some plugins dot-repeatable like leap
- \*[mini.files](https://github.com/echasnovski/mini.files): Navigate and manipulate file system
- \*[mini.hipatterns](https://github.com/echasnovski/mini.hipatterns): highlight patterns in text
- \*[vim-startuptime](https://github.com/dstein64/vim-startuptime)
- [obsidian-nvim](https://github.com/epwalsh/obsidian.nvim)
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo): better folding
- [fold-preview](https://github.com/anuvyklack/fold-preview.nvim)

### Libraries

- \*[nvim-nio](https://github.com/nvim-neotest/nvim-nio): A library for asynchronous IO in Neovim, inspired by the
  asyncio library in Python

### Other

- explore other [mini.nvim](https://github.com/echasnovski/mini.nvim) plugins
- check [neovimcraft](https://neovimcraft.com) webpage
- check [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) list.
  [This](https://www.trackawesomelist.com/2023/12/) is a nice changelog for the same list
