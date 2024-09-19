require("config.options")
require("lazy-config")
require("config.keymap")
vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})
