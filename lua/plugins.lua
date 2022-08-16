require("configs.bootstrap")

local plugins = {
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["wbthomason/packer.nvim"] = {},
}

require("configs.packer").run(plugins)
