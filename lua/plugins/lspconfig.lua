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
			vim.opt.termguicolors = true
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●", -- Custom symbol
					spacing = 2,
					format = function(diagnostic)
						if #diagnostic.message > 80 then
							return string.sub(diagnostic.message, 1, 77) .. "..."
						end
						return diagnostic.message
					end,
				},
				float = {
					source = "always", -- Show the source of the diagnostic
					border = "rounded", -- Floating window border style
				},
				severity_sort = true, -- Sort diagnostics by severity
				update_in_insert = false, -- Don’t update while in insert mode
			})
			require("nvim-highlight-colors").setup({})
			-- Setup LSP keymaps
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			-- Mason setup
			require("mason").setup({})

			-- Mason-LSPConfig setup
			require("mason-lspconfig").setup({
				-- You can specify which LSP servers to ensure are installed
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			-- CMP setup for autocompletion
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				experimental = {
					ghost_text = true, -- Enable ghost text
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For luasnip users
					end,
				},
				window = {
					completion = {
						-- Adjust completion window size (width, height)
						col_offset = 1,
						side_padding = 1,
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<Tab>"] = cmp_action.luasnip_supertab(),
					["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<S-Tab>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				formatting = {
					format = function(entry, item)
						local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
						item = lspkind.cmp_format({
							mode = "symbol", -- show only symbol annotations
							maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							-- can also be a function to dynamically calculate max width such as
							-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
							ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
							show_labelDetails = true, -- show labelDetails in menu. Disabled by default

							-- The function below will be called before any actual modifications from lspkind
							-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
							before = function(entry, vim_item)
								return vim_item
							end,
						})(entry, item)
						if color_item.abbr_hl_group then
							item.kind_hl_group = color_item.abbr_hl_group
							item.kind = color_item.abbr
						end
						return item
					end,
				},
				sources = cmp.config.sources({
					--             { name = 'luasnip' }, -- For luasnip users
					{ name = "nvim_lsp" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Additional filetype configuration (optional)
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for / and ?
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':'
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
