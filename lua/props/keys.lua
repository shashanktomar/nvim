local editor = require("props.editor")
local copilot_chat = require("props.copilot-chat")
local icons = require("props.ui").icons.which_key.custom_icons

local M = {}
M.global_keys = function()
  local unmap = vim.keymap.del
  local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set(mode, lhs, rhs, opts)
  end
  ----------------------------------------------
  ---------- Unmap lazyvim bindings ------------
  ----------------------------------------------

  unmap("n", "<leader>`") -- Remove switch to last buffer binding

  -- we are using toggleTerm, disable lazyvim terminal
  unmap("n", "<c-/>") -- FIX: this unmap is not working
  unmap("n", "<leader>ft")
  unmap("n", "<leader>fT")

  -- disable other lazyvim bindings
  unmap("n", "<leader>uT") -- we don't use Treesitter highlight toggle

  ----------------------------------------------
  ---------------- Generic ---------------------
  ----------------------------------------------
  -- FIX: not working if defined using which_key

  map("n", ";", ":", { desc = "Command mode" })

  -- Press jj fast to exit insert mode
  map("i", "jj", "<Esc>", { desc = "Exit insert mode", nowait = true })
  map("i", "<Esc>", "<Nop>")

  ----------------------------------------------
  --------------- Movement ---------------------
  ----------------------------------------------

  -- In insert mode
  map("i", "<C-e>", "<End>", { desc = "Goto end of line" })
  map("i", "<C-b>", "<ESC>^i", { desc = "Goto beginning of line" })
  map("i", "<C-h>", "<Left>", { desc = "Move left" })
  map("i", "<C-l>", "<Right>", { desc = "Move right" })
  map("i", "<C-k>", "<Up>", { desc = "Move up" })
  map("i", "<C-j>", "<Down>", { desc = "Move down" })

  -- FIX: not working if defined using which_key
  -- Quick movement on line
  map("n", "H", "^", { desc = "󰞓 Goto beginning of line" })
  map("n", "L", "$", { desc = "󰞔 Goto end of line" })

  ----------------------------------------------
  ------------------- Toggles ------------------
  ----------------------------------------------

  -- Change conceal toggle, check https://github.com/LazyVim/LazyVim/blob/78cf6ee024cbf6a17dc8406555eb131994cd8b63/lua/lazyvim/config/keymaps.lua#L125C1-L126C125
  unmap("n", "<leader>uc")
  local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
  map("n", "<leader>uC", function()
    LazyVim.toggle("conceallevel", false, { 0, conceallevel })
  end, { desc = "Toggle Conceal" })

  require("util.toggle").set_toggle("<leader>u", editor.toggles)
end

----------------------------------------------
------------------- LSP ----------------------
----------------------------------------------

--  TODO: Check if this is still required
--
-- map("n", "<leader>ci", function()
--   local clients = vim.lsp.get_clients({ name = "tsserver" })
--   local ts_sever_missing = vim.tbl_isempty(clients)
--   if ts_sever_missing then
--     LzUtil.error("No tsserver attached", { title = "Command Unavailable" })
--     return
--   end
--   vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = { vim.fn.expand("%:p") } })
-- end, { desc = "organize imports" })

----------------------------------------------
------------------- Plugins ------------------
----------------------------------------------

M.which_key = {
  groups = {
    { "<F2>", group = "debug" },
    { "<leader>", group = "|____|" },
    { "<leader>cl", group = "lsp info" },
    { "<leader>i", group = "insert" },
    { "<leader>m", group = "move" },
    { "<leader>sv", group = "vim" },
    { "<leader>t", group = "terminals" },
    { "<leader>tc", group = "commands" },
    { "<leader>z", group = "project specific" },
  },
  keys = {
    -- movement
    { "<leader>o", "<cmd>b#<CR>", desc = "Previous buffer", mode = "n" },
    { "H", "^", desc = "Goto beginning of line", mode = "n", remap = true }, -- FIX: Not working through whichkey
    { "L", "$", desc = "Goto end of line", mode = "n", remap = true }, -- FIX: Not working through whichkey
    -- yank and save
    { "<C-c>", "<cmd>%y+<CR>", desc = "Copy whole file", mode = "n" },
    { "<leader>bs", "<cmd>wa<cr><esc>", desc = "Save all buffers", mode = "n" },
    -- insert
    {
      "<leader>io",
      "o<Esc>",
      desc = "Insert a new line down",
      mode = "n",
      icon = icons.line_down,
    },
    {
      "<leader>iO",
      "O<Esc>",
      desc = "Insert a new line up",
      mode = "n",
      icon = icons.line_up,
    },
    { "<leader>iw", "gsaiw", desc = "Surround word", remap = true, mode = "n" },
    { "<leader>iW", "gsaiw?", desc = "Surround word interactively", remap = true, mode = "n" },
    -- move
    { "<leader>ma", desc = "@parameter.inner" },
    --debug
    { "<F2>s", "<cmd>luafile lua/scratch/test.lua<cr>", desc = "Execute scratch/test.lua", mode = "n" },
    -- buffers
    {
      "<leader>bf",
      function()
        LazyVim.info(vim.bo.filetype)
      end,
      desc = "Print filetype",
      mode = "n",
    },
    --external commands
    {
      "<leader>fw",
      function()
        local word = vim.fn.expand("<cword>")
        vim.fn.system("open dict://" .. word)
      end,
      desc = "Define Word (dictionary)",
      icon = icons.dict,
    },
    -- treesitter
    { "<leader>ui", "<cmd>InspectTree<cr>", desc = "Inspect Tree (Treesitter)", mode = "n" },
    { "<leader>uI", ":lua vim.show_pos()", desc = "Inspect Pos (Treesitter)", mode = "n" },
    { "<leader>uq", "<cmd>EditQuery<cr>", desc = "Edit Query (Treesitter)", mode = "n" },
    -- system
    { "<leader>v", "<cmd>version<cr>", desc = "Print Neovim Info", mode = "n" },
    { "<leader>uT", desc = "Colorscheme(Theme) with Preview" },
  },
}

M.lsp = {
  disable = { "<leader>cl", false },
  enable = { "<leader>cll", "<cmd>LspInfo<cr>", "Lsp Info" },

  null_ls = {
    { "<leader>cln", "<cmd>NullLsInfo<cr>", desc = "NullLs" },
  },

  mason = {
    { "<leader>cm", false }, -- disable lazyvim binding
    { "<leader>clm", "<cmd>Mason<cr>" }, -- disable lazyvim binding
  },
}

-- There are three operations wrt text_objects: select, move and swap
-- select: this is handled by mini_ai, here we are defining additional text_objects but they are also defined by lazyvim and mini itself. Check http://www.lazyvim.org/plugins/treesitter#nvim-treesitter
-- swap: this is handled by nvim-treesitter-textobjects
-- move: this is handled by both
M.text_objects = {
  -- the following text objects are provide by nvim-treesitter-textobjects which is setup by lazyvim. mini.ai support them and that is what we are doing here
  mini_ai = {
    ["/"] = {
      a = "@comment.outer",
      i = "@comment.inner",
    },

    v = { -- v as in variable
      a = "@assignment.outer", -- this select the full variable assignment with both sides
      i = "@assignment.inner", -- this select the lhs or rhs based on your cursor location
    },

    y = { -- lhs as in y=x
      -- there is no inner or outer for this
      a = "@assignment.lhs",
      i = "@assignment.lhs",
    },

    x = { -- rhs as in y=x
      -- there is no inner or outer for this
      a = "@assignment.rhs",
      i = "@assignment.rhs",
    },
    -- this is supported by very few languages, check https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    S = {
      a = "@statement.outer",
      i = "@statement.inner",
    },
    -- custom loaded from after/queries directory
    P = { -- FIX: Not working
      a = "@tag.attribute",
      i = "@tag.attribute",
    },
  },

  treesitter = {
    move = {
      goto_next_start = {
        ["]/"] = "@comment.outer",
        ["]v"] = "@assignment.outer",
        ["]y"] = "@assignment.lhs",
        ["]x"] = "@assignment.rhs",
      },
      goto_previous_start = {
        ["[/"] = "@comment.outer",
        ["[v"] = "@assignment.outer",
        ["[y"] = "@assignment.lhs",
        ["[x"] = "@assignment.rhs",
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ["<leader>ma"] = "@parameter.inner",
        ["<leader>mf"] = "@function.outer",
        ["<leader>mp"] = "@tag.attribute",
      },
      swap_previous = {
        ["<leader>mA"] = "@parameter.inner",
        ["<leader>mF"] = "@function.outer",
        ["<leader>mP"] = "@tag.attribute",
      },
    },
  },

  which_key = {
    {
      mode = { "o", "x" },
      { "a/", desc = "Comment" },
      { "aP", desc = "Attribute" },
      { "aS", desc = "Statement Outer" },
      { "av", desc = "Variable Assignment" },
      { "ax", desc = "RHS In Assignment" },
      { "ay", desc = "LHS In Assignment" },
      { "i/", desc = "Comment" },
      { "iP", desc = "Attribute" },
      { "iS", desc = "Statement Inner" },
      { "iv", desc = "Variable Assignment Current Side" },
      { "ix", desc = "RHS In Assignment" },
      { "iy", desc = "LHS In Assignment" },
    },
  },
}

M.yanky = {
  { "gp", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise)" },
  { "gP", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise)" },
  { "[p", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History" },
  { "]p", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History" },
}

M.copilot = {
  {
    "<leader>at",
    function()
      vim.g.copilot_enabled = not vim.g.copilot_enabled
      if vim.g.copilot_enabled then
        vim.cmd("Copilot enable")
      else
        vim.cmd("Copilot disable")
      end
    end,
    desc = "Toggle Copilot Suggestions",
  },
}

M.copilot_chat = {
  {
    "<leader>a.",
    function()
      return require("CopilotChat").stop()
    end,
    desc = "Stop Chat Output (CopilotChat)",
    mode = { "n", "v" },
  },
  { "<leader>aQ", copilot_chat.quick_chat_on_buffer, desc = "Quick Chat On Buffer (CopilotChat)" },
  { "<leader>as", copilot_chat.save_chat, desc = "Save To History (CopilotChat)" },
  { "<leader>al", copilot_chat.load_chat, desc = "Load From History (CopilotChat)" },
}

M.dial = function()
  -- copied from https://github.com/LazyVim/LazyVim/blob/73e72ee21d7673e4040bb99f4de834410219d6cb/lua/lazyvim/plugins/extras/editor/dial.lua#L5s
  ---@param increment boolean
  ---@param g? boolean
  local function map_dial(increment, g)
    local mode = vim.fn.mode(true)
    -- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
    local is_visual = mode == "v" or mode == "V" or mode == "\22"
    local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
    local group = editor.dials.dials_by_ft[vim.bo.filetype] or "default"
    return require("dial.map")[func](group)
  end

  return {
    { "<C-a>", false },
    { "g<C-a>", false },
    {
      "<C-g>",
      function()
        return map_dial(true)
      end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" },
    },
    {
      "<C-x>",
      function()
        return map_dial(false)
      end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" },
    },
    {
      "g<C-g>",
      function()
        return map_dial(true, true)
      end,
      expr = true,
      desc = "Increment",
      mode = { "n", "v" },
    },
    {
      "g<C-x>",
      function()
        return map_dial(false, true)
      end,
      expr = true,
      desc = "Decrement",
      mode = { "n", "v" },
    },
  }
end

M.neo_tree = {
  -- we use this to switch buffers and rather use the longer version <leader>fe to open neo_tree
  { "<leader>e", false },
}

M.toggle_term = {
  terminals = {
    ["<leader>tcp"] = { cmd = "pnpm_install" },
    ["<leader>th"] = { cmd = "htop" },
    ["<leader>tm"] = { cmd = "glow", ft = "markdown" },
    ["<leader>tn"] = { cmd = "neofetch" },
    ["<leader>tw"] = { cmd = "wtfutil" },
    ["<leader>zm"] = { cmd = "lighthouse_mongo_uat" },
    ["<leader>tk"] = { cmd = "k9s" },
  },
  keys = {
    { "<c-\\>", "<cmd>ToggleTerm<CR>", desc = "terminal", mode = { "n", "t" } },
    { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "terminal" },
    { "<leader>t2", "<cmd>2ToggleTerm name=second<CR>", desc = "2nd split terminal" },
    { "<leader>t3", "<cmd>3ToggleTerm name=third<CR>", desc = "3nd split terminal" },
    { "<leader>ts", "<cmd>TermSelect<CR>", desc = "select terminal" },
  },
}

M.telescope = {
  keys = {
    -- change the keymap for switching buffers
    { "<leader>,", false }, -- disable lazyvim binding
    { "<leader>e", "<cmd>Telescope buffers<cr>", desc = "Buffers" },

    -- additional find file commands
    { -- find files in the same directory of current buffer
      "<leader>f.",
      function()
        require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Sibling Files",
    },

    -- change the keymap for recent buffers
    { "<leader>fr", false }, -- disable lazyvim binding
    { "<leader>fR", false }, -- disable lazyvim binding
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    { "<leader>fO", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },

    -- overrides
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0 theme=ivy height=25<cr>", desc = "Document Diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics theme=ivy height=25<cr>", desc = "Workspace Diagnostics" },

    -- insert
    { '<leader>s"', false }, -- disable lazyvim binding
    -- { "<leader>is", "<cmd>Telescope symbols<cr>", desc = "😊 Symbols/Emojis" },
    { '<leader>i"', "<cmd>Telescope registers<cr>", desc = "Paste From Registers" },

    -- additonal search commands
    { "<leader>sH", "<cmd>Telescope search_history<cr>", desc = "Search History" },
    { "<leader>se", "<cmd>Telescope env<cr>", desc = "Environment Vars" },
    {
      "<leader>sE",
      function()
        require("telescope.builtin").symbols({ sources = { "emoji", "kaomoji", "gitmoji" } })
      end,
      desc = "Telescope Symbols",
    },
    { "<leader>sQ", "<cmd>Telescope quickfixhistory<cr>", desc = "Quickfix History" },
    { "<leader>sN", "<cmd>Telescope notify<cr>", desc = "Notification History" },

    -- vim search commands
    { "<leader>sa", false }, -- disable auto command search set by lazyvim
    { "<leader>sva", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sC", false }, -- disable command search set by lazyvim
    { "<leader>svc", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>svh", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", false }, -- disable keymaps search set by lazyvim
    { "<leader>svk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>so", false }, -- disable vim_options search set by lazyvim
    { "<leader>svo", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>svf", "<cmd>Telescope filetypes<cr>", desc = "Filetypes" },

    -- change colorscheme shortcut
    { "<leader>uC", false },
    {
      "<leader>uu",
      LazyVim.pick("colorscheme", { enable_preview = true, previewer = false, layout_config = { width = 0.3 } }),
      desc = "UI Colorscheme with Preview",
      remap = true,
    },
  },
  buffers = {
    n = {
      ["d"] = require("telescope.actions").delete_buffer,
    },
  },
}

return M
