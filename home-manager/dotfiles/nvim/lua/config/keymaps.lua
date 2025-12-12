-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
print("Keymaps Sourced")

map("n", "<leader>p", '"_dP', { silent = true, desc = "Paste from system clipboard" })

-- NOTE: Terminal commands
map("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, desc = "ToggleTerm" })
map("n", "<leader>tT", "<cmd>e term://zsh<cr>", { silent = true, desc = "Open a terminal in a new buffer window" })
map(
  "n",
  "<leader>td",
  "<cmd>TermExec cmd='doppler tui' direction=float<cr>",
  { silent = true, desc = "Doppler (ToggleTerm)" }
)

-- NOTE: Config reloading
map("n", "<leader>rf", "<cmd>so<cr>", { silent = true, desc = "Source current lua file" })
map("n", "<leader>rl", ":LspRestart<cr>", { silent = true, desc = "Restart LSP" })

map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Scroll down", remap = false })
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Scroll up", remap = false })
map(
  "n",
  "<leader>rq",
  "<cmd>s/\\v('|\")/`/g<cr>",
  { silent = true, desc = "Replace single and double quotes with backticks" }
)

map("n", "<leader>gb", "<cmd>BlamerToggle<cr>", { silent = true, desc = "Toggle Git Blamer" })
map("n", "<leader>bt", "<cmd>TransparentToggle<cr>", { silent = true, desc = "Toggle transparent background" })
