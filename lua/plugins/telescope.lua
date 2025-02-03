return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	cmd = "Telescope",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
	config = function()
		require("telescope").setup({})
	end,
}
