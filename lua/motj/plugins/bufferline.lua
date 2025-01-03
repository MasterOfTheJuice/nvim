return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
    options = {
      numbers = "ordinal", -- Show both buffer index and ID
			close_command = "Bdelete! %d", -- Close buffer command
			right_mouse_command = "Bdelete! %d", -- Right-click close command
			left_mouse_command = "buffer %d", -- Left-click to switch buffers
			middle_mouse_command = nil, -- Disable middle-click close
			indicator = {
				icon = "▎", -- Indicator icon for active buffer
				style = "icon",
			},
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			name_formatter = function(buf) -- Shorten buffer names if needed
				if buf.name:match("%.md") then
					return vim.fn.fnamemodify(buf.name, ":t:r")
				end
			end,
			max_name_length = 18, -- Limit buffer name length
			max_prefix_length = 15, -- Limit buffer prefix length
			tab_size = 18, -- Tab size in the bufferline
			diagnostics = "nvim_lsp", -- Show LSP diagnostics
			diagnostics_update_in_insert = false, -- Update diagnostics in insert mode
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
			show_buffer_icons = true, -- Enable/disable filetype icons
			show_buffer_close_icons = true, -- Show buffer close icons
			show_close_icon = true, -- Show close icon in the bufferline
			show_tab_indicators = true, -- Show tab indicators
			persist_buffer_sort = true, -- Keep buffer order persistent
			separator_style = "think", -- Separator style ('slant' | 'thick' | 'thin' | { 'any', 'any' })
			enforce_regular_tabs = false, -- Enforce all tabs to be of equal size
			always_show_bufferline = true, -- Always show the bufferline
      }
		})
		local keymap = vim.keymap

		keymap.set(
			"n",
			"<leader>xx",
			":BufferLineCloseOthers<CR>",
			{ noremap = true, silent = true, desc = "Close all buffers but current" }
		)
		keymap.set(
			"n",
			"<A-Right>",
			":BufferLineCycleNext<CR>",
			{ noremap = true, silent = true, desc = "Nexy Buffer" }
		)
		keymap.set(
			"n",
			"<A-Left>",
			":BufferLineCyclePrev<CR>",
			{ noremap = true, silent = true, desc = "Previous Buffer" }
		)
	end,
}
