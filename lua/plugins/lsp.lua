return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-path",         -- For path completions
        "hrsh7th/cmp-buffer",       -- For buffer completions
        "L3MON4D3/LuaSnip",         -- Snippet engine
        "saadparwaiz1/cmp_luasnip", -- Snippet completions
        "windwp/nvim-autopairs",
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local cmp = require("cmp")
        local cmp_action = require('lsp-zero').cmp_action()

        -- LSP Keybindings for each buffer where LSP is active
        local lsp_attach = function(client, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }

            local mappings = {
                ["K"] = vim.lsp.buf.hover,
                ["gd"] = vim.lsp.buf.definition,
                ["gD"] = vim.lsp.buf.declaration,
                ["gi"] = vim.lsp.buf.implementation,
                ["go"] = vim.lsp.buf.type_definition,
                ["gr"] = vim.lsp.buf.references,
                ["gs"] = vim.lsp.buf.signature_help,
                ["<F2>"] = vim.lsp.buf.rename,
                ["<F4>"] = vim.lsp.buf.code_action,
            }

            for key, func in pairs(mappings) do
                vim.keymap.set("n", key, func, opts)
            end
        end

        -- Extend LSP config with capabilities and attach function
        lsp_zero.extend_lspconfig({
            sign_text = true,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = lsp_attach,
        })

        -- Setup Mason and LSP config
        require("mason").setup()
        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({})
                end,
            },
        })

        -- Autocompletion setup
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For luasnip users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp_action.tab_complete(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            }),
        })

        -- Command-line completion
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = 'buffer' } }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        -- Autopairs with nvim-cmp integration
        local npairs = require('nvim-autopairs')
        npairs.setup({
            check_ts = true, -- Enable Treesitter integration
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}
