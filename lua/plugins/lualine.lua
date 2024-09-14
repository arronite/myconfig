return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup {
            sections = {
                lualine_c = {
                    {
                        function()
                            local filepath = vim.fn.expand('%:p')
                            if filepath == '' then
                                return 'No File'
                            end
                            return filepath
                        end,
                        cond = function()
                            return vim.bo.filetype ~= 'NvimTree'
                        end,
                    },
                },
            },
            options = {
                theme = 'auto',
            },
            tabline = {},
            extensions = { 'nvim-tree' },
        }
    end,
}
