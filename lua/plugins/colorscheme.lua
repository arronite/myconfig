return {

	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("lualine").setup({
			-- ... other confi

			options = {
				theme = "auto", -- "auto" will set the theme dynamically based on the colorscheme
			},
			-- ... other config
		})
		require("cyberdream").setup({ transparent = true })

		vim.cmd([[colorscheme cyberdream]])
	end,
}
