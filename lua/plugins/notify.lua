return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		require("notify").setup({
			background_colour = "#6dd7ff",
			fps = 60,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			max_width = 50,
			minimum_width = 25,
			render = "compact",
			stages = "fade",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 2000,
			top_down = true,
		})
		vim.notify = require("notify")
	end,
}
