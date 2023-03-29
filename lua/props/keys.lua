local Util = require("lazyvim.util")
local M = {}

M.setup_keys = function()
  local paste = require("util.paste")

  local unmap = vim.keymap.del
  local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set(mode, lhs, rhs, opts)
  end
  ----------------------------------------------
  ---------- Unmap lazyvim bindings ------------
  ----------------------------------------------

  -- Remove window resizing keys
  unmap("n", "<C-Up>")
  unmap("n", "<C-Down>")
  unmap("n", "<C-Left>")
  unmap("n", "<C-Right>")

  -- Remove switch to last buffer binding
  unmap("n", "<leader>`")

  ----------------------------------------------
  ---------------- Generic ---------------------
  ----------------------------------------------

  map("n", ";", ":", { desc = "Command mode" })

  -- Press jj fast to exit insert mode
  map("i", "jj", "<Esc>", { desc = "Exit insert mode", nowait = true })
  map("i", "<Esc>", "<Nop>")

  ----------------------------------------------
  --------------- Movement ---------------------
  ----------------------------------------------

  -- In insert mode
  map("i", "<C-b>", "<ESC>^i", { desc = "Move to the end of line" })
  map("i", "<C-e>", "<End>", { desc = "Move to the beginning of line" })
  map("i", "<C-h>", "<Left>", { desc = "Move left" })
  map("i", "<C-l>", "<Right>", { desc = "Move right" })
  map("i", "<C-j>", "<Down>", { desc = "Move down" })
  map("i", "<C-k>", "<Up>", { desc = "Move up" })

  -- Quick movement on line
  map("n", "H", "^", { desc = "Goto beginning of line" })
  map("n", "L", "$", { desc = "Goto end of line" })

  -- Goto to last buffer
  map("n", "<leader>a", "<cmd> b# <CR>", { desc = "last buffer" })

  ----------------------------------------------
  -------------- Yank and Save -----------------
  ----------------------------------------------

  -- Copy whole file
  map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })

  -- Save all files
  map({ "i", "v", "n", "s" }, "<C-S-s>", "<cmd>wa<cr><esc>", { desc = "Save all files" })

  ----------------------------------------------
  -------------- Insert -----------------
  ----------------------------------------------

  map("n", "<leader>il", function()
    paste.insert_from_register("+", "markdown_link")
  end, { desc = "Insert markdown link" })

  ----------------------------------------------
  ------------------- TODO ---------------------
  ----------------------------------------------

  --  TODO: Find alternate keys for these

  -- Move Lines
  -- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
  -- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
  -- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
  -- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
  -- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
  -- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
  --
  -- ['<C-M-j>'] = { '<Esc>:m .+1<CR>', ' move line down' },
  -- ['<C-M-k>'] = { '<Esc>:m .-2<CR>', ' move line up' },
  -- ['<M-o>'] = { 'o<Esc>', '↵ insert a new line down' },
  -- ['<M-O>'] = { 'O<Esc>', '↵ insert a new line up' },
  -- ['<A-p>'] = { '"0p', 'p from yank register' },
  -- ['<A-P>'] = { '"0P', 'P from yank register' },
end

M.which_key = {
  groups = {
    ["<leader>sv"] = { name = "+vim" },
    ["<leader>i"] = { name = "+insert" },
  },
}

M.null_ls = {
  { "<leader>cn", "<cmd>NullLsInfo<cr>", desc = "NullLs" },
}

M.telescope = {
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
}

return M
