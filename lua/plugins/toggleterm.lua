return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]],
			hide_numbers = true, -- Hide numbers from terminal buffers
			shade_filetypes = {}, -- Can be used to shade inactive terminal filetypes
			shade_terminals = true, -- Shade the terminal background
			start_in_insert = true, -- Start terminals in insert mode
			insert_mappings = true, -- Close terminal with <esc> in insert mode
			terminal_mappings = true, -- Close terminal with <esc> in terminal mode
			persist_size = true,
			shell = vim.o.shell,
		})

		function _G.toggle_float_term()
			local Terminal = require("toggleterm.terminal").Terminal
			local float_term = Terminal:new({
				direction = "float",
				hidden = true,
			})
			float_term:toggle()
		end

		function _G.toggle_horizontal_term()
			local Terminal = require("toggleterm.terminal").Terminal
			local horizontal_term = Terminal:new({ direction = "horizontal", hidden = true })
			horizontal_term:toggle()
		end

		function _G.toggle_vertical_term()
			local Terminal = require("toggleterm.terminal").Terminal
			local vertical_term = Terminal:new({ direction = "vertical", hidden = true })
			vertical_term:toggle()
		end
	end,
}