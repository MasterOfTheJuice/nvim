return {
	"romgrk/barbar.nvim",
	dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	config = function()
    local barbar = require("barbar")

    barbar.setup({
      animation = true,
      sidebar_filetypes = {
        NvimTree = true
      },
    })

    -- Function to confirm and handle buffer changes before closing the buffer.
    local function confirm_buffer_changes()
      -- Check if the current buffer has been modified
      if vim.api.nvim_buf_get_option(0, "modified") then
        -- Define the options for the user prompt
        local options = { "&Yes", "&No", "&Cancel" }
        local message = "Save file?"
        -- Show a confirmation dialog to the user
        local choice = vim.fn.confirm(message, table.concat(options, "\n"), 0)
        -- Handle user choice
        if choice == 1 then
          vim.cmd("w") -- Save the buffer
        elseif choice == 3 then
          return -- Cancel buffer closing
        end
      end
      vim.cmd("BufferClose!") -- Close the buffer
    end

    local keymap = vim.keymap
    -- local api = vim.api
    keymap.set("n", "<A-x>", confirm_buffer_changes, { silent = true, desc = "Close buffer - Confirming changes" })
    keymap.set("n", "<leader>xx", ":BufferCloseAllButCurrentOrPinned<CR>", { noremap = true, silent = true, desc = "Close all buffers but current" })
    keymap.set("n", "<A-Right>", ":BufferNext<CR>", { noremap = true, silent = true, desc = "Nexy Buffer" })
    keymap.set("n", "<A-Left>", ":BufferPrevious<CR>", { noremap = true, silent = true, desc = "Previous Buffer" })
  end,
}

