return {
  "aaron-p1/match-visual.nvim",
  config = function ()
    local visimatch = require("match-visual")
    visimatch.setup({
      min_length = 1,
      hl_group = "Visual"
    })
  end
}
