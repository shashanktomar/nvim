local M = {}

M.prompts = {
  Refactor = {
    prompt = [[
  Your task is to review the provided code snippet and provide the refactored code, focusing specifically on its readability, maintainability and DRY principle
  Format your response as follows:
  - if no refactoring is required, respond with:
  "No refactoring is required on this code"

  - format structure

    == Proposed Changes ==
    line=<start_line>-<end_line>

    <refactored code-block>
    == End Proposed Changes ==
    Reasoning:
    A very brief reasoning behind the change

  - if there are multiple changes, add multiple blocks

  Example response:

  == Proposed Changes ==
  line=11-15

  for i, marker in ipairs(markers) do
    if marker == current_marker then
      local new_index = (i - 1 + addend) % #markers + 1
      return markers[new_index]
    end
  end
  == End Proposed Changes ==
  Reasoning:
  The for loop is changed to remove a redundant check

  == Proposed Changes ==
  line=23-36

  if list_marker then
    local normalized_marker = list_marker:lower()
    local new_marker = get_next_marker(normalized_marker, addend)
    text = leading_spaces .. new_marker .. line_text
  end
  == End Proposed Changes ==
  Reasoning:
  The code is shortened but achieve the same task

  ]],
  },
  -- For default prompts see https://github.com/CopilotC-Nvim/CopilotChat.nvim#default-configuration
  -- For system prompts see https://github.com/CopilotC-Nvim/CopilotChat.nvim/blob/canary/lua/CopilotChat/prompts.lua
  Explain = "/COPILOT_EXPLAIN Explain how the following code works.", -- override explain prompt
  BetterNamings = "Provide better names for the following variables and functions.",
  -- Text related prompts TODO: Make them better and use system prompts
  Summarize = "Summarize the following text.",
  Spelling = "Correct any grammar and spelling errors in the following text.",
  Wording = "Improve the grammar and wording of the following text.",
  Concise = "Rewrite the following text to make it more concise.",
}

M.quick_chat_on_buffer = function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end

M.save_chat = function()
  local date = os.date("%Y-%m-%d")
  local input = vim.fn.input("Chat Name: ", date)
  if input ~= "" then
    require("CopilotChat").save(input)
  end
end

M.load_chat = function()
  local history_path = vim.fn.stdpath("data") .. "/copilotchat_history"
  local opts = {
    cwd = history_path,
    attach_mappings = function(prompt_bufnr, map)
      local load_chat = function()
        local entry = require("telescope.actions.state").get_selected_entry()
        local fileName = entry[1]:gsub("%.json$", "")
        require("telescope.actions").close(prompt_bufnr)
        require("CopilotChat").load(fileName) -- filename is available at entry[1]
      end

      local delete_chat = function()
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
        picker:delete_selection(function(selection)
          os.remove(history_path .. "/" .. selection[1]) -- filename is available at selection[1]
        end)
      end

      map("n", "d", delete_chat, { desc = "delete" })
      map("n", "l", load_chat, { desc = "load chat" })
      map("i", "<c-l>", load_chat, { desc = "load chat" })
      return true
    end,
  }
  require("telescope.builtin").find_files(opts)
end

return M
