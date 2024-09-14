return {
    'nvimdev/dashboard-nvim',
    dependencies = {
        "folke/persistence.nvim"
    },
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {

            theme = 'doom',
            config = {
                week_header = {
                    enable = true,
                },
                center = {

                    { desc = 'New File', group = '@property', action = function()
                        local current_dir = vim.fn.expand('%:h')
                        local filename = 'filename' -- Replace with your desired filename
                        vim.cmd('edit ' .. current_dir .. '/' .. filename)
                    end, key = 'n' },
                    { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = ' Apps',
                        group = 'DiagnosticHint',
                        action = 'Telescope app',
                        key = 'a',
                    },
                    {
                        desc = ' Resume',
                        group = 'Number',
                        action = function()
                            require("persistence").load()
                            vim.cmd("NvimTreeToggle")
                        end,
                        key = 'r',
                    },
                },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
