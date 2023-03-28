-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
