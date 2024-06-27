local keys = require("props.keys")

return {
  {
    "neovim/nvim-lspconfig",
    -- as suggested here http://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
    opts = function()
      local lsp_keys = require("lazyvim.plugins.lsp.keymaps").get()
      lsp_keys[#lsp_keys + 1] = keys.lsp.disable
      lsp_keys[#lsp_keys + 1] = keys.lsp.enable
    end,
  },
  {
    "garymjr/nvim-snippets",
    opts = {
      extended_filetypes = {
        typescript = { "javascript" },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    keys = keys.lsp.null_ls,
  },
  { "mason.nvim", keys = keys.lsp.mason },
}
