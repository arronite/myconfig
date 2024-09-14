return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {
            open_mapping = [[<C-\>]], -- Key mapping to toggle terminal
            hide_numbers = true,      -- Hide the number column in terminal buffers
            direction = "float",
            shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
            shading_factor = 0,       -- the percentage by which to lighten dark terminal background, default: -30
            shading_ratio = 0,        -- the ratio of shading factor for light/dark terminal background, default: -3

            float_opts = {
                border = 'curved', },

        }
    end,
}
