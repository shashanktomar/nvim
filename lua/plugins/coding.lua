local keys = require("props.keys")
local editor = require("props.editor")
local copilot_chat = require("props.copilot-chat")

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
    "zbirenbaum/copilot.lua",
    init = function()
      if not vim.g.copilot_enabled then
        vim.cmd("Copilot disable")
      end
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = keys.copilot_chat,
    opts = {
      prompts = copilot_chat.prompts,
    },
  },

  ----------------------------------------------
  ------------------ CMP -----------------------
  ----------------------------------------------
  -- add toggle
  {
    "hrsh7th/nvim-cmp",
    opts = {
      enabled = function()
        local ft = vim.bo.filetype
        if ft.find(ft, "neo%-tree") or ft.find(ft, "Telescope") then
          return false
        end
        return vim.g[editor.toggles.CMP.flag]
      end,
    },
  },

  -- add sources
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "hrsh7th/cmp-emoji", "hrsh7th/cmp-cmdline" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
    init = function()
      local cmp = require("cmp")
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        -- matching = { disallow_symbol_nonprefix_matching = false },
      })
    end,
  },

  -- Use <tab> for completion and snippets (supertab)
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping({
          i = cmp.mapping.confirm({ select = true }),
          s = cmp.mapping.confirm({ select = true }),
          c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      })
    end,
  },
}
