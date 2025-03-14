if not vim.g.lang_python then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          keys = {
            {
              "<leader>cx",
              LazyVim.lsp.action["source.fixAll"],
              desc = "Fix all auto-fixable issues",
            },
          },
        },
      },
    },
  },
  -- {
  --   -- plugin for jupyter notebooks
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   dependencies = { "3rd/image.nvim" },
  --   build = ":UpdateRemotePlugins",
  --   init = function()
  --     -- I find auto open annoying, keep in mind setting this option will require setting
  --     -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
  --     vim.g.molten_auto_open_output = false
  --
  --     -- optional, I like wrapping. works for virt text and the output window
  --     vim.g.molten_wrap_output = true
  --
  --     -- Output as virtual text. Allows outputs to always be shown, works with images, but can
  --     -- be buggy with longer images
  --     vim.g.molten_virt_text_output = true
  --
  --     -- this will make it so the output shows up below the \`\`\` cell delimiter
  --     vim.g.molten_virt_lines_off_by_1 = true
  --
  --     vim.g.molten_image_provider = "image.nvim"
  --     vim.g.molten_output_win_max_height = 20
  --   end,
  --   -- ft = "notebook",
  --   lazy = false,
  -- },
}
