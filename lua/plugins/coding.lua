local keys = require("props.keys")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Apply to all LSP servers
        ["*"] = {
          keys = {
            keys.lsp.disable,
            keys.lsp.enable,
          },
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    keys = keys.lsp.null_ls,
  },
  { "mason.nvim", keys = keys.lsp.mason },

  {
    "nvim-mini/mini.ai",
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
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewFileHistory", "DiffviewOpen" },
    keys = keys.diff_view,
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
}
