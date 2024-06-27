-- Keymaps are automatically loaded on the VeryLazy event

-- This file define Global keymaps. They are keymaps that are always active.
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua.
-- Default LazyVim keymaps can be deleted with vim.keymap.del

-- Add any additional global keymaps here.
-- To put plugin specific keymaps, see http://www.lazyvim.org/configuration/plugins#%EF%B8%8F-adding--disabling-plugin-keymaps
-- To put LSP specific keymaps, see http://www.lazyvim.org/configuration/keymaps#lsp-keymaps

require("props.keys").global_keys()
