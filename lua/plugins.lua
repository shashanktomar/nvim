require("configs.bootstrap")

local ok, packer = pcall(require, "packer")
if not ok then
  return
end

local plugins = {
  -- Core essential plugins
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },
  ["wbthomason/packer.nvim"] = {},

  -- Speed up differed plugins
  ["lewis6991/impatient.nvim"] = {},
}

packer.startup(function(use)
  local table = {}

  for key, _ in pairs(plugins) do
    plugins[key][1] = key
    table[#table + 1] = plugins[key]
  end
  for _, v in pairs(table) do
    use(v)
  end

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
