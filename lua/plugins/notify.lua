return {
	"rcarriga/nvim-notify",
	event = "VimEnter",
	config = function()
		require("notify").setup({
			background_colour = "NotifyBackground",
			fps = 60,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 25,
			render = "compact",
			stages = "fade",
			time_formats = {
				notification = "%T",
				notification_history = "%FT%T",
			},
			timeout = 5000,
			top_down = true,
		})
		vim.notify = require("notify")
	end,
}
