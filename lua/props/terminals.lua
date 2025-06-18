return function()
  local Terminal = require("toggleterm.terminal").Terminal
  --  If the hidden key is set to true, this terminal will not be toggled by normal toggleterm commands such as :ToggleTerm
  --  or the open mapping. It will only open and close by using the returned terminal object.
  return {
    htop = function()
      return Terminal:new({
        cmd = "htop",
        display_name = "htop",
        hidden = true,
        direction = "float",
      })
    end,
    neofetch = function()
      return Terminal:new({
        cmd = "neofetch",
        display_name = "neofetch",
        hidden = true,
        direction = "float",
        close_on_exit = false,
      })
    end,
    daylight = function()
      return Terminal:new({
        cmd = "daylight",
        display_name = "daylight",
        hidden = true,
        direction = "float",
        close_on_exit = false,
      })
    end,
    wtfutil = function()
      return Terminal:new({
        cmd = "wtfutil",
        display_name = "wtfutil",
        hidden = true,
        direction = "float",
        close_on_exit = false,
      })
    end,
    k9s = function()
      return Terminal:new({
        cmd = "k9s",
        display_name = "k9s",
        hidden = true,
        direction = "float",
        close_on_exit = true,
      })
    end,
    glow = function()
      return Terminal:new({
        cmd = "glow -p " .. vim.api.nvim_buf_get_name(0),
        display_name = "Preview",
        hidden = true,
        direction = "float", -- for right to work, we need to modify edgy settings
        close_on_exit = true,
      })
    end,
    pnpm_install = function()
      return Terminal:new({
        cmd = "pnpm install",
        display_name = "pnpm install",
        hidden = true,
        direction = "horizontal",
        close_on_exit = false,
        auto_scroll = true,
        on_exit = function(t, job, exit_code, name)
          if exit_code == 1 then
            LazyVim.notify("pnpm install failed", { title = "Failure", level = vim.log.levels.ERROR })
            return
          elseif exit_code == 0 then
            LazyVim.notify("pnpm install done", { title = "Success", level = vim.log.levels.INFO })
            return
          else
            LazyVim.notify(
              "pnpm install unknonw status: " .. exit_code,
              { title = "Failure", level = vim.log.levels.ERROR }
            )
            return
          end
        end,
      })
    end,

    --#project specific
    lighthouse_mongo_uat = function()
      return Terminal:new({
        cmd = "mongosh $(security find-generic-password -a ${USER} -s lighthouse-mongo-uat -w)",
        display_name = "mongo-uat",
        hidden = true,
        direction = "float", -- for right to work, we need to modify edgy settings
        close_on_exit = true,
      })
    end,

    lighthouse_mongo_prod = function()
      return Terminal:new({
        cmd = "mongosh $(security find-generic-password -a ${USER} -s lighthouse-mongo-prod -w)",
        display_name = "mongo-prod",
        hidden = true,
        direction = "float", -- for right to work, we need to modify edgy settings
        close_on_exit = true,
      })
    end,
  }
end
