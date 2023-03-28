local Util = require("lazyvim.util")

local M = {}

M["which-key"] = {
  groups = {
    ["<leader>sv"] = { name = "+vim" },
    ["<leader>i"] = { name = "+insert" },
  },
}

M.telescope = {
  keys = {
    -- change the keymap to switch buffers
    { "<leader>,", false }, -- disable the keymap to switch buffers
    { "<leader>p", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },

    -- change the keymap to explore recent files
    { "<leader>fr", false }, -- disable the keymap to switch buffers
    { "<leader>fo", Util.telescope("oldfiles"), desc = "Recent" },
    { "<leader>fo", Util.telescope("oldfiles"), desc = "Recent" },

    -- add more file search commands
    {
      "<leader>fF",
      "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
      desc = "Find All (Including Hidden)",
    },

    -- code related commands
    { "<leader>cD", "<cmd>Telescope diagnostics bufnr=0 theme=ivy height=30<cr>", desc = "Buffer Diagnostics" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },

    -- insert
    { "<leader>ie", "<cmd>Telescope symbols<cr>", desc = "😊 Emojis" },
    { "<leader>ip", "<cmd>Telescope registers<cr>", desc = "Paste From Registers" },

    -- search commands
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fzy Search In Buffer" },
    { "<leader>sH", "<cmd>Telescope search_history<cr>", desc = "Search History" },
    { "<leader>se", "<cmd>Telescope env<cr>", desc = "Environment Vars" },
    { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
    { "<leader>sQ", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },

    -- vim search commands
    { "<leader>sa", false }, -- disable auto command search set by lazyvim
    { "<leader>sva", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sC", false }, -- disable command search set by lazyvim
    { "<leader>svc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sH", false }, -- disable highlight groups search set by lazyvim
    { "<leader>svh", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", false }, -- disable keymaps search set by lazyvim
    { "<leader>svk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>so", false }, -- disable keymaps search set by lazyvim
    { "<leader>svo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>svf", "<cmd>Telescope filetypes<cr>", desc = "Filetypes" },
  },
}

return M
