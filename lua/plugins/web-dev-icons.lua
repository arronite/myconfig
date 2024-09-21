return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
			color_icons = true, -- globally enable different highlight colors per icon
			default = true, -- globally enable default icons
			strict = true, -- strict selection of icons

			-- Filename-specific icon overrides
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore",
				},
			},

			-- Extension-specific icon overrides
			override_by_extension = {
				["log"] = {
					icon = "",
					color = "#81e043",
					name = "Log",
				},
				["module.ts"] = {
					icon = "󰚿", -- You can choose any icon you like
					color = "#e61a00", -- NestJS-like red color
					name = "NestJSModule",
				},
				["controller.ts"] = {
					icon = "󰚿", -- You can choose any icon you like
					color = "#1a80e6", -- NestJS-like red color
					name = "NestJScontroller",
				},
				["service.ts"] = {
					icon = "󰚿", -- You can choose any icon you like
					color = "#cce600", -- NestJS-like red color
					name = "NestJSservice",
				},
				["guard.ts"] = {
					icon = "󰚿", -- You can choose any icon you like
					color = "#4de633", -- NestJS-like red color
					name = "NestJSgaurd",
				},
			},

			-- Operating system-specific overrides
			override_by_operating_system = {
				["apple"] = {
					icon = "",
					color = "#A2AAAD",
					cterm_color = "248",
					name = "Apple",
				},
			},
		})
	end,
}
