vim.filetype.add ({
  extension = {
    j2 = "jinja"
  }
})

-- vim.api.nvim_create_augroup("SetFileTypeByRegex", { clear = true })
--
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--     group = "SetFileTypeByRegex",
--     pattern = "*.yaml.j2",
--     callback = function()
--         vim.bo.filetype = "yaml"
--     end,
-- })
