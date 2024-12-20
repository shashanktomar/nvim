local props = require("props.ui")
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        separator = props.icons.which_key.separator,
        group = props.icons.which_key.group,
        rules = props.icons.which_key.rules,
      },
      layout = props.layout.which_key,
      win = props.win.which_key,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = props.win.mason,
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = props.win.none_ls,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      require("lspconfig.ui.windows").default_options.border = "single"
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = {
  --     window = {
  --       completion = require("cmp").config.window.bordered(),
  --       documentation = require("cmp").config.window.bordered(),
  --     },
  --     formatting = {
  --       fields = { "kind", "abbr", "menu" },
  --       format = function(entry, item)
  --         local icons = LazyVim.config.icons.kinds
  --         local sources = props.cmp.sources
  --
  --         local get_source = function(name)
  --           if sources[name] then
  --             return sources[name]
  --           end
  --
  --           vim.notify_once(
  --             ("CMP source is missing for %s, add it in props/ui.lua"):format(name),
  --             vim.log.levels.WARN,
  --             { title = "CMP source missing!" }
  --           )
  --           return "[UNKNOWN]"
  --         end
  --
  --         if icons[item.kind] then
  --           item.kind = icons[item.kind]
  --         end
  --
  --         item.menu = get_source(entry.source.name)
  --         return item
  --       end,
  --     },
  --   },
  -- },
}
