-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local props = require("props.editor")

local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("drts_" .. name, { clear = true })
end

-- close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = props.close_with_q_filetypes,
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- C# folding with #region/#endregion markers
autocmd("FileType", {
  group = augroup("cs_folding"),
  pattern = "cs",
  callback = function()
    vim.opt_local.foldmethod = "marker"
    vim.opt_local.foldmarker = "#region,#endregion"
    vim.opt_local.foldlevelstart = 99
    vim.opt_local.foldenable = true
  end,
})
