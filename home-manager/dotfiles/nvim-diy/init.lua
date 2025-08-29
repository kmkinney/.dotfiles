-------------------
-- NEOVIM CONFIG --
-------------------

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-------------
-- Options --
-------------
vim.o.undofile = true
vim.o.mouse = "a"
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Display
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.showmode = false
vim.o.conceallevel = 0
vim.o.confirm = true
vim.o.wrap = true

-- Tabs
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-------------
-- Keymaps --
-------------
