return {
  "moll/vim-bbye",
  config = function ()
    local keymap = vim.keymap
		keymap.set("n", "<A-x>", ":Bdelete!<CR>:BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "Close buffer - Confirming changes" })
  end
}
