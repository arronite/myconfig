return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 50,                -- Height for horizontal, width for vertical
            open_mapping = [[<C-\>]], -- Key mapping to toggle terminal
            hide_numbers = true,      -- Hide the number column in terminal buffers
            shade_terminals = true,
            direction = "float",      -- Can be 'vertical', 'horizontal', 'tab', or 'float'
        }
    end,
}
