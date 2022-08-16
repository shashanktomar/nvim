local M = {}

M.packer_cmds = {
  "PackerSnapshot",
  "PackerSnapshotRollback",
  "PackerSnapshotDelete",
  "PackerInstall",
  "PackerUpdate",
  "PackerSync",
  "PackerClean",
  "PackerCompile",
  "PackerStatus",
  "PackerProfile",
  "PackerLoad",
}

M.run = function(plugins)
  local ok, packer = pcall(require, "packer")

  if not ok then
    return
  end

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
end

return M
