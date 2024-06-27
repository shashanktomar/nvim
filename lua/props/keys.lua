local LzUtil = require("lazy.core.util")
local M = {}

M.global_keys = function()
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
  map("i", "<C-e>", "<End>", { desc = "󰞔 Goto end of line" })
  map("i", "<C-b>", "<ESC>^i", { desc = "󰞓 Goto beginning of line" })
  map("i", "<C-h>", "<Left>", { desc = " Move left" })
  map("i", "<C-l>", "<Right>", { desc = " Move right" })
  map("i", "<C-k>", "<Up>", { desc = " Move up" })
  map("i", "<C-j>", "<Down>", { desc = " Move down" })

  -- Quick movement on line
  map("n", "H", "^", { desc = "󰞓 Goto beginning of line" })
  map("n", "L", "$", { desc = "󰞔 Goto end of line" })

  -- Goto to last buffer
  map("n", "<leader>a", "<cmd> b# <CR>", { desc = "󰒮 Previous buffer" })

  ----------------------------------------------
  -------------- Yank and Save -----------------
  ----------------------------------------------

  -- Copy whole file
  map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "󰆏 Copy whole file" })

  -- Save all files
  -- map({ "i", "v", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = " Save all files" })

  -- Paste from yank register
  -- map("n", "gp", '"0p', { desc = "p from yank register" })
  -- map("n", "gP", '"0P', { desc = "P from yank register" })

  ----------------------------------------------
  ------------------- Insert -------------------
  ----------------------------------------------

  map("n", "<leader>il", function()
    paste.insert_from_register("+", "markdown_link")
  end, { desc = " Insert markdown link" })
  map("n", "<leader>iO", "O<Esc>", { desc = "󰞕 Insert a new line up" })
  map("n", "<leader>io", "o<Esc>", { desc = "󰞒 Insert a new line down" })

  ----------------------------------------------
  ------------------- Debug --------------------
  ----------------------------------------------

  map("n", "<F2>s", "<cmd>luafile lua/scratch/test.lua<cr>", { desc = "Execute scratch/test.lua" })

  ----------------------------------------------
  ------------------- LSP ----------------------
  ----------------------------------------------

  -- map("n", "<leader>ci", function()
  --   local clients = vim.lsp.get_clients({ name = "tsserver" })
  --   local ts_sever_missing = vim.tbl_isempty(clients)
  --   if ts_sever_missing then
  --     LzUtil.error("No tsserver attached", { title = "Command Unavailable" })
  --     return
  --   end
  --   vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
  -- end, { desc = "organize imports" })

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
end

M.which_key = {
  groups = {
    ["<leader>sv"] = { name = "+vim" },
    ["<leader>i"] = { name = "+insert" },
    ["<leader>cl"] = { name = "+lsp" },
    ["<F2>"] = { name = "+debug" },
  },
}

M.lsp = {
  disable = { "<leader>cl", false },
  enable = { "<leader>cll", "<cmd>LspInfo<cr>", "Lsp Info" },

  null_ls = {
    { "<leader>cln", "<cmd>NullLsInfo<cr>", desc = "NullLs" },
  },

  mason = {
    { "<leader>cm", false }, -- disable lazyvim binding
    { "<leader>clm", "<cmd>Mason<cr>" }, -- disable lazyvim binding
  },
}

M.neo_tree = {
  -- we use this to switch buffers and rather use the longer version <leader>fe to open neo_tree
  { "<leader>e", false },
}

M.telescope = {
  -- change the keymap for switching buffers
  { "<leader>,", false }, -- disable lazyvim binding
  { "<leader>e", "<cmd>Telescope buffers<cr>", desc = "Buffers" },

  -- overrides
  { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0 theme=ivy height=25<cr>", desc = "Document Diagnostics" },
  { "<leader>sD", "<cmd>Telescope diagnostics theme=ivy height=25<cr>", desc = "Workspace Diagnostics" },

  -- insert
  { '<leader>s"', false }, -- disable lazyvim binding
  -- { "<leader>is", "<cmd>Telescope symbols<cr>", desc = "😊 Symbols/Emojis" },
  { '<leader>i"', "<cmd>Telescope registers<cr>", desc = "Paste From Registers" },

  -- additonal search commands
  { "<leader>sH", "<cmd>Telescope search_history<cr>", desc = "Search History" },
  { "<leader>se", "<cmd>Telescope env<cr>", desc = "Environment Vars" },
  { "<leader>sQ", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
  { "<leader>sN", "<cmd>Telescope notify<cr>", desc = "Notification History" },

  -- vim search commands
  { "<leader>sa", false }, -- disable auto command search set by lazyvim
  { "<leader>sva", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
  { "<leader>sC", false }, -- disable command search set by lazyvim
  { "<leader>svc", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>svh", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
  { "<leader>sk", false }, -- disable keymaps search set by lazyvim
  { "<leader>svk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
  { "<leader>so", false }, -- disable vim_options search set by lazyvim
  { "<leader>svo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  { "<leader>svf", "<cmd>Telescope filetypes<cr>", desc = "Filetypes" },
}

return M
