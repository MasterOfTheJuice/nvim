return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		vim.env.OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
		require("chatgpt").setup({
			-- this config assumes you have OPENAI_API_KEY environment variable set
			openai_params = {
				-- NOTE: model can be a function returning the model name
				-- this is useful if you want to change the model on the fly
				-- using commands
				-- Example:
				-- model = function()
				--     if some_condition() then
				--         return "gpt-4-1106-preview"
				--     else
				--         return "gpt-3.5-turbo"
				--     end
				-- end,
				model = "gpt-4o-mini",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 4095,
				temperature = 0.2,
				top_p = 0.1,
				n = 1,
			},
		})
    local wk = require("which-key")
    wk.add({"<leader>c", group = "ChatGPT", icon = { name = "platformio.ini", cat = "file" }})
    local keymap = vim.keymap
    keymap.set({ "n", "v" }, "<leader>cc", "<cmd>ChatGPT<CR>", { noremap = true, silent = true, desc = "ChatGPT" })
    keymap.set({ "n", "v" }, "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", { noremap = true, silent = true, desc = "Edit with instruction" })
    keymap.set({ "n", "v" }, "<leader>ce", "<cmd>ChatGPTRun grammar_correction<CR>", { noremap = true, silent = true, desc = "Grammer correction" })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim",
	},
}
