return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = { ui = { bg = "#0c0c0f", bg_gutter = "none" } },
						lotus = {},
						dragon = {},
						all = {},
					},
				},
				overrides = function(colors) -- add/modify highlights
					local theme = colors.theme
					return {
						NormalFloat = { bg = "none", blend = vim.o.winblend },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						NormalDark = { fg = theme.ui.fg_dim, bg = "none" },
					}
				end,
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},
}
