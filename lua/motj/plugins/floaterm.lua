return {
	"voldikss/vim-floaterm",
	dependencies = {
		"liuchengxu/vim-clap",
		"voldikss/clap-floaterm",
	},
	config = function()
		-- Configure Floaterm options
		vim.g.floaterm_width = 0.6 -- 80% of screen width
		vim.g.floaterm_height = 0.8 -- 80% of screen height
		vim.g.floaterm_wintype = "float" -- Floating window type
		vim.g.floaterm_autoclose = 1 -- Automatically close terminal when process exits

		-- Key mappings for Floaterm
		vim.keymap.set("n", "<F12>", ":FloatermToggle<CR>", { desc = "Toggle Floaterm" })
		vim.keymap.set("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "Toggle Floaterm" })
		vim.keymap.set("n", "<F6>", ":FloatermNew<CR>", { desc = "New Floaterm" })
		vim.keymap.set("t", "<F6>", "<C-\\><C-n>:FloatermNew<CR>", { desc = "New Floaterm" })
		vim.keymap.set("n", "<F7>", ":FloatermPrev>", { desc = "Previous Floaterm" })
		vim.keymap.set("t", "<F7>", "<C-\\><C-n>:FloatermPrev<CR>", { desc = "Previous Floaterm" })
		vim.keymap.set("n", "<F8>", ":FloatermNext<CR>", { desc = "Next Floaterm" })
		vim.keymap.set("t", "<F8>", "<C-\\><C-n>:FloatermNext<CR>", { desc = "Next Floaterm" })
		vim.keymap.set("n", "<F9>", ":FloatermKill<CR>", { desc = "Kill Floaterm" })
		vim.keymap.set("t", "<F9>", "<C-\\><C-n>:FloatermKill<CR>", { desc = "Kill Floaterm" })
		vim.keymap.set("n", "<F10>", ":Clap floaterm<CR>", { desc = "Kill Floaterm" })

		-- Optional: Set default shell for Floaterm
		vim.g.floaterm_shell = vim.fn.executable("zsh") == 1 and "zsh" or "bash"
		vim.o.winblend = 10
		vim.cmd([[autocmd User FloatermOpen setlocal winhighlight=Normal:NormalDark]])
	end,
}
