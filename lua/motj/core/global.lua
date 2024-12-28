function MOVE_RIGHT_IF_IN_TREE()
	-- Check if the current buffer name contains "NvimTree"
	if string.find(vim.api.nvim_buf_get_name(0), "NvimTree") then
		-- If "NvimTree" is in the buffer name, move focus to the right window
		vim.api.nvim_command("wincmd l")
	end
end

KEYMAP_OPTIONS = "noremap = true, silent = true"
