return {
	"uga-rosa/ccc.nvim",
	config = function()
		local ccc = require("ccc")
		local mapping = ccc.mapping

		ccc.setup({
			-- Your preferred settings
			-- Example: enable highlighte
			highlighter = {
				auto_enable = true,
				lsp = true,
			},
			alpha_show = "show",
		})
	end,
}
