local keys = require("props.keys")
local copilot_chat = require("props.copilot-chat")

return {

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
  {
    "olimorris/codecompanion.nvim",
    cmd = "CodeCompanionChat",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
