local editor = require("props.editor")

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

  ----------------------------------------------
  ---------------- Generic ---------------------
  ----------------------------------------------

  map("n", ";", ":", { desc = "Command mode" })

  -- Press jj fast to exit insert mode
  map("i", "jj", "<Esc>", { desc = "Exit insert mode", nowait = true })
  map("i", "<Esc>", "<Nop>")

  -- print neovim version
  map("n", "<leader>v", "<cmd>version<cr>", { desc = "Print Neovim Version" })

  ----------------------------------------------
  --------------- Movement ---------------------
  ----------------------------------------------

  -- In insert mode
  map("i", "<C-e>", "<End>", { desc = "󰞔 Goto end of line" })
  map("i", "<C-b>", "<ESC>^i", { desc = "󰞓 Goto beginning of line" })
  map("i", "<C-h>", "<Left>", { desc = " Move left" })
  map("i", "<C-l>", "<Right>", { desc = " Move right" })
  map("i", "<C-k>", "<Up>", { desc = " Move up" })
  map("i", "<C-j>", "<Down>", { desc = " Move down" })

  -- Quick movement on line
  map("n", "H", "^", { desc = "󰞓 Goto beginning of line" })
  map("n", "L", "$", { desc = "󰞔 Goto end of line" })

  -- Goto to last buffer
  map("n", "<leader>a", "<cmd> b# <CR>", { desc = "󰒮 Previous buffer" })

  ----------------------------------------------
  -------------- Yank and Save -----------------
  ----------------------------------------------

  -- Copy whole file
  map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "󰆏 Copy whole file" })

  -- Save all files
  -- map({ "i", "v", "n", "s" }, "<C-S>", "<cmd>wa<cr><esc>", { desc = " Save all files" })

  -- Paste from yank register
  -- map("n", "gp", '"0p', { desc = "p from yank register" })
  -- map("n", "gP", '"0P', { desc = "P from yank register" })

  ----------------------------------------------
  ------------------- Insert -------------------
  ----------------------------------------------

  map("n", "<leader>iO", "O<Esc>", { desc = "󰞕 Insert a new line up" })
  map("n", "<leader>io", "o<Esc>", { desc = "󰞒 Insert a new line down" })
  map("n", "<leader>iw", "gsaiw", { desc = "󰡎 Surround word", remap = true })
  map("n", "<leader>iW", "gsaiw?", { desc = "󰡎 Surround word interactively", remap = true })
  map("n", "<leader>iw", "gsaiw", { desc = "󰡎 Surround word", remap = true })

  ----------------------------------------------
  ------------------- Debug --------------------
  ----------------------------------------------

  map("n", "<F2>s", "<cmd>luafile lua/scratch/test.lua<cr>", { desc = "Execute scratch/test.lua" })

  ----------------------------------------------
  ---------------- Treesitter ------------------
  ----------------------------------------------

  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos (Treesitter)" })
  map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree (Treesitter)" })
  map("n", "<leader>uq", "<cmd>EditQuery<cr>", { desc = "Edit Query (Treesitter)" })

  ----------------------------------------------
  -------------- External Programs -------------
  ----------------------------------------------

  map("n", "<leader>fw", function()
    local word = vim.fn.expand("<cword>")
    vim.fn.system("open dict://" .. word)
  end)

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
------------------- TODO ---------------------
----------------------------------------------

--  TODO: Find alternate keys for these

-- Move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
--
-- ['<C-M-j>'] = { '<Esc>:m .+1<CR>', ' move line down' },
-- ['<C-M-k>'] = { '<Esc>:m .-2<CR>', ' move line up' },
-- ['<M-o>'] = { 'o<Esc>', '↵ insert a new line down' },
-- ['<M-O>'] = { 'O<Esc>', '↵ insert a new line up' },
--

----------------------------------------------
------------------- Plugins ------------------
----------------------------------------------

M.which_key = {
  groups = {
    ["<leader>"] = {
      name = "|____|",
      i = { name = "+insert" },
      t = { name = "+terminals" },
      m = { name = "+move", a = "@parameter.inner" }, -- need atleast one command inside to regiseter this, its a which_key bug
      ["sv"] = { name = "+vim" },
      ["cl"] = { name = "+lsp" },
      ["tc"] = { name = "+commands" },
    },
    ["<F2>"] = { name = "+debug" },
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
      },
      swap_previous = {
        ["<leader>mA"] = "@parameter.inner",
        ["<leader>mF"] = "@function.outer",
      },
    },
  },

  which_key = {
    mode = { "o", "x" },
    a = {
      ["/"] = "Comment",
      v = "Variable Assignment",
      y = "LHS In Assignment",
      x = "RHS In Assignment",
      S = "Statement Outer",
    },
    i = {
      ["/"] = "Comment",
      v = "Variable Assignment Current Side",
      y = "LHS In Assignment",
      x = "RHS In Assignment",
      S = "Statement Inner",
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
    "<leader>ua",
    function()
      vim.g.copilot_enabled = not vim.g.copilot_enabled
      if vim.g.copilot_enabled then
        vim.cmd("Copilot enable")
      else
        vim.cmd("Copilot disable")
      end
    end,
    desc = "Toggle Copilot",
  },
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
  },
  keys = {
    -- disable lazyvim terminal bindings, FIX: None of the disables is working
    { "<c-/>", false },
    { "<leader>ft", false },
    { "<leader>fT", false },
    { "<c-\\>", "<cmd>ToggleTerm<CR>", desc = "terminal", mode = { "n", "t" } },
    { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "terminal" },
    { "<leader>t2", "<cmd>2ToggleTerm name=second<CR>", desc = "2nd split terminal" },
    { "<leader>t3", "<cmd>3ToggleTerm name=third<CR>", desc = "3nd split terminal" },
    { "<leader>ts", "<cmd>TermSelect<CR>", desc = "select terminal" },
  },
}

M.telescope = {
  -- change the keymap for switching buffers
  { "<leader>,", false }, -- disable lazyvim binding
  { "<leader>e", "<cmd>Telescope buffers<cr>", desc = "Buffers" },

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
  { "<leader>uT", false }, -- we don't use Treesitter highlight toggle
  { "<leader>uT", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme(Theme) with Preview" },
}

return M
