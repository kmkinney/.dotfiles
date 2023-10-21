-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
print("Keymaps Sourced")

-- map("i", "kj", "<esc>", { silent = true, desc = "Exit insert mode" })
-- map("i", "jk", "<esc>", { silent = true, desc = "Exit insert mode" })
map("n", "<leader>p", '"_dP', { silent = true, desc = "Paste from system clipboard" })

-- NOTE: Terminal commands
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, desc = "ToggleTerm" })
map("n", "<leader>tT", "<cmd>e term://zsh<cr>", { silent = true, desc = "Open a terminal in a new buffer window" })

-- NOTE: Config reloading
map("n", "<leader>rf", "<cmd>so<cr>", { silent = true, desc = "Source current lua file" })

map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down", remap = false })
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up", remap = false })
