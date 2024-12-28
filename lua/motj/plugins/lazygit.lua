return {
	"kdheepak/lazygit.nvim",
	lazy = false,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Toggle LazyGit" })
	end,
}
