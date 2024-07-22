--  _              _    _
-- | |            | |  (_)
-- | | ___ __ ___ | | ___ _ __  _ __   ___ _   _
-- | |/ / '_ ` _ \| |/ / | '_ \| '_ \ / _ \ | | |
-- |   <| | | | | |   <| | | | | | | |  __/ |_| |
-- |_|\_\_| |_| |_|_|\_\_|_| |_|_| |_|\___|\__, |
--                                          __/ |
--                                         |___/
-- LazyNvim Config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "everforest",
      },
    },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  checker = { enabled = false },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
