-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Toogleterm
function _G.set_terminal_keymaps()
	local map = vim.keymap.set
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { noremap = true, silent = true, desc = "Navigate window left" })
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { noremap = true, silent = true, desc = "Navigate window bottom" })
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { noremap = true, silent = true, desc = "Navigate window top" })
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { noremap = true, silent = true, desc = "Navigate window right" })
	map("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true, silent = true, desc = "Navigate window left" }) -- Allows C-w window commands
end
-- This function is called when the terminal opens
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("ToggleTermCustomGroup", { clear = true }),
	pattern = "term://*",
	callback = function()
		vim.cmd("setlocal nospell norelativenumber nonumber")
		_G.set_terminal_keymaps()
	end,
})
--Quit Neovim if NvimTree and toggleterm is the only window left
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil or bufname:match("toggleterm#") ~= nil then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		if 1 == #wins - #floating_wins - #tree_wins then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(tree_wins) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})