-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode with jj" })
map("n", "<leader>o", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree", noremap = true, silent = true })
map('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer', noremap = true, silent = true })