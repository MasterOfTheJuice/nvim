return {
	"wfxr/minimap.vim",
	config = function()
		vim.g.minimap_width = 15
		vim.g.minimap_auto_start = 1
		vim.g.minimap_auto_start_win_enter = 1
		vim.g.minimap_highlight_range = 1 -- Highlight the range of the minimap
		-- Optional: Key mappings for minimap
		vim.api.nvim_set_keymap("n", "<Leader>M", ":MinimapToggle<CR>", { noremap = true, silent = true })
    vim.cmd [[
      augroup MinimapAutoStart
        autocmd!
        autocmd BufEnter * MinimapToggle
      augroup END
    ]]
	end,
}
