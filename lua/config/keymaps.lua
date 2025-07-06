-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Exit insert mode with jj" })

-- Change buffer with space <tab number>
for i = 1, 9 do
  map(
    "n",
    string.format("<leader>%d", i),
    string.format("<Cmd>BufferLineGoToBuffer %d<CR>", i),
    { desc = string.format("BufferLine: Go To Buffer %d", i) }
  )
  map(
    "n",
    string.format("<leader>c%d", i),
    string.format("<Cmd>BufferLineCloseRight %d<CR><Cmd>bdelete!<CR>", i - 1),
    { desc = string.format("BufferLine: Close Buffer %d", i) }
  )
end
