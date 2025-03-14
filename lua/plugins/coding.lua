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
    "nvimtools/none-ls.nvim",
    keys = keys.lsp.null_ls,
  },
  { "mason.nvim", keys = keys.lsp.mason },

  {
    "echasnovski/mini.ai",
    opts = function(_, opts)
      local mini_ai = require("mini.ai")
      local k = {}
      for key, value in pairs(keys.text_objects.mini_ai) do
        k[key] = mini_ai.gen_spec.treesitter(value)
      end
      opts.custom_textobjects = vim.tbl_deep_extend("force", opts.custom_textobjects, k)

      local ok, wk = pcall(require, "which-key")
      if not ok then
        return
      end
      wk.add(keys.text_objects.which_key)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      textobjects = keys.text_objects.treesitter,
    },
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {
          filter_dir = function(name, rel_path, root)
            return name ~= "node_modules"
          end,
        },
      },
    },
  },
}
