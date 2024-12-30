return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local substitute = require("substitute")

		substitute.setup()

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "s", substitute.operator, { noremap = true, silent = true, desc = "Substitute with motion" })
		keymap.set("n", "ss", substitute.line, { noremap = true, silent = true, desc = "Substitute line" })
		keymap.set("n", "S", substitute.eol, { noremap = true, silent = true, desc = "Substitute to end of line" })
		keymap.set("x", "s", substitute.visual, { noremap = true, silent = true, desc = "Substitute in visual mode" })
	end,
}
