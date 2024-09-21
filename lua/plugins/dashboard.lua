return {
	"nvimdev/dashboard-nvim",
	dependencies = {
		"folke/persistence.nvim",
	},
	event = "VimEnter",
	config = function()
		-- Setup dashboard
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					"                                  ",
					"                                  ",
					"                                  ",
					"                                  ",
					" _   _                            ",
					"| | | |                           ",
					"| |_| | _   _  _ __    ___  _ __  ",
					"|  _  || | | || '_ \\  / _ \\| '__| ",
					"| | | || |_| || |_) ||  __/| |    ",
					"\\_| |_/ \\__, || .__/  \\___||_|    ",
					"         __/ || |                 ",
					"        |___/ |_|                 ",
					"                                  ",
					"                                  ",
					"                                  ",
					"                                  ",
				},
				center = {
					{
						desc = "󰈞 New File",
						group = "@property",
						action = function()
							local current_dir = vim.fn.expand("%:h")
							local filename = "filename" -- Replace with your desired filename
							vim.cmd("edit " .. current_dir .. "/" .. filename)
						end,
						key = "n",
					},
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon_hl = "@variable",
						desc = " Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Telescope app",
						key = "a",
					},
					{
						desc = " Resume",
						group = "Number",
						action = function()
							require("persistence").load()
							vim.cmd("NvimTreeToggle")
						end,
						key = "r",
					},
				},
			},
		})
		vim.cmd([[
  highlight DashboardHeader guifg=#00ffff
  highlight DashboardDesc guifg=#2dc00c
  highlight DashboardFooter guifg=#c905ff
]])
	end,
}
