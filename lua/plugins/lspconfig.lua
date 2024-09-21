return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "windwp/nvim-autopairs" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind.nvim" },
			{ "brenoprata10/nvim-highlight-colors" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local cmp_action = require("lsp-zero").cmp_action()

			-- Autopairs setup
			require("nvim-autopairs").setup({})
			lsp_zero.extend_lspconfig({
				sign_text = true,
				lsp_attach = lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- Diagnostics config
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					spacing = 2,
					format = function(diagnostic)
						if #diagnostic.message > 80 then
							return string.sub(diagnostic.message, 1, 77) .. "..."
						end
						return diagnostic.message
					end,
				},
				float = {
					source = "always",
					border = "rounded",
				},
				severity_sort = true,
				update_in_insert = false,
			})

			-- Mason setup
			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							--	capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,
				},
			})

			-- CMP setup for autocompletion
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				experimental = { ghost_text = true },
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					format = function(entry, item)
						item = lspkind.cmp_format({
							mode = "symbol",
							maxwidth = 50,
							ellipsis_char = "...",
						})(entry, item)
						return item
					end,
				},
				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Additional filetype configurations
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- Autopairs integration
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
