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
					" ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
					" ████╗  ██║██║   ██║██║████╗ ████║",
					" ██╔██╗ ██║██║   ██║██║██╔████╔██║",
					" ██║╚██╗██║██║   ██║██║██║╚██╔╝██║",
					" ██║ ╚████║╚██████╔╝██║██║ ╚═╝ ██║",
					" ╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝     ╚═╝",
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
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
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
  highlight DashboardHeader guifg=#b31a00
  highlight DashboardCenter guifg=#00ebeb
  highlight DashboardFooter guifg=#cc1acc
]])
	end,
}
