return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true


		-- OR setup with some options
		require("nvim-tree").setup({ diagnostics = {
    enable = true,
    show_on_dirs = true,  -- If you want to show diagnostics on folders
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
