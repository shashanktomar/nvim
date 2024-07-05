if not vim.g.lang_frontend then
  return {}
end

-- TODO: do we need rustywind for tailwind
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        -- "html", --already added by lazyvim
        -- "tsx", --already added by lazyvim
        -- "javascript", --already added by lazyvim
        -- "typescript", --already added by lazyvim
        "glsl",
      },
    },
  },
}
