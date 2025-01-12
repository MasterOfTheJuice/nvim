return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"JMarkin/nvim-tree.lua-float-preview",
			lazy = true,
			-- default
			opts = {
				-- Whether the float preview is enabled by default. When set to false, it has to be "toggled" on.
				toggled_on = true,
				-- wrap nvimtree commands
				wrap_nvimtree_commands = true,
				-- lines for scroll
				scroll_lines = 20,
				-- window config
				window = {
					style = "minimal",
					relative = "editor",
					border = "rounded",
					wrap = false,
				},
				mapping = {
					-- scroll down float buffer
					down = { "<C-]>" },
					-- scroll up float buffer
					up = { "<C-[>", "<C-u>" },
					-- enable/disable float windows
					toggle = { "<C-s>" },
				},
				-- hooks if return false preview doesn't shown
				hooks = {
					pre_open = function(path)
						-- if file > 5 MB or not text -> not preview
						local size = require("float-preview.utils").get_size(path)
						if type(size) ~= "number" then
							return false
						end
						local is_text = require("float-preview.utils").is_text(path)
						return size < 5 and is_text
					end,
					post_open = function(bufnr)
						return true
					end,
				},
			},
		},
	},
	config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      local FloatPreview = require("float-preview")
      api.config.mappings.default_on_attach(bufnr)
      FloatPreview.attach_nvimtree(bufnr)
    end
    local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
      on_attach = on_attach,
			view = {
				width = 40,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<leader>ee",
			"<cmd>NvimTreeFocus<CR>",
			{ desc = "Toggle file explorer", noremap = true, silent = true, nowait = true }
		) -- toggle file explorer
		keymap.set(
			"n",
			"<leader>ef",
			"<cmd>NvimTreeFindFile<CR>",
			{ desc = "Toggle file explorer on current file", noremap = true, silent = true, nowait = true }
		) -- toggle file explorer on current file
		keymap.set(
			"n",
			"<leader>ec",
			"<cmd>NvimTreeCollapse<CR>",
			{ desc = "Collapse file explorer", noremap = true, silent = true, nowait = true }
		) -- collapse file explorer
		keymap.set(
			"n",
			"<leader>er",
			"<cmd>NvimTreeRefresh<CR>",
			{ desc = "Refresh file explorer", noremap = true, silent = true, nowait = true }
		) -- refresh file explorer
		keymap.set(
			"n",
			"<leader>ew",
			"<cmd>NvimTreeResize 70<CR>",
			{ desc = "Enlarge file explorer width", noremap = true, silent = true, nowait = true }
		) -- enlarge file explorer
		keymap.set(
			"n",
			"<leader>es",
			"<cmd>NvimTreeResize 40<CR>",
			{ desc = "Restore file explorer width", noremap = true, silent = true, nowait = true }
		) -- resize file explorer
	end,
}
