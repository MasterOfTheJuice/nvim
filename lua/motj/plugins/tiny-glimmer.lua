return {
	"rachartier/tiny-glimmer.nvim",
	event = "TextYankPost",
	config = function()
		local glimmer = require("tiny-glimmer")
		glimmer.setup({
			enabled = true,
			default_animation = "left_to_right",
			refresh_interval_ms = 6,
			animations = {
				fade = {
					max_duration = 250,
					chars_for_max_duration = 10,
          from_color = "#666ab3",
          to_color = "#b87414",
				},
				bounce = {
					max_duration = 500,
					chars_for_max_duration = 20,
					oscillation_count = 1,
          from_color = "#666ab3",
          to_color = "#b87414",
				},
				left_to_right = {
					max_duration = 350,
					chars_for_max_duration = 40,
					lingering_time = 50,
          from_color = "#666ab3",
          to_color = "#b87414",
				},
				pulse = {
					max_duration = 400,
					chars_for_max_duration = 15,
					pulse_count = 2,
					intensity = 1.2,
          from_color = "#666ab3",
          to_color = "#b87414",
				},
				rainbow = {
					max_duration = 600,
					chars_for_max_duration = 20,
				},
			},
		})
	end,
}
