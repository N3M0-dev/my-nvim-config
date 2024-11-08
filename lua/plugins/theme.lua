local theme_plugins = {
    {
        "HoNamDuong/hybrid.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("hybrid").setup()
            vim.cmd.colorscheme("hybrid")
        end
    },
    {
        'Aasim-A/scrollEOF.nvim',
        event = { 'CursorMoved', 'WinScrolled' },
        opts = require("config.plugin_confs.scrollEOF"),
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            require("config.plugin_confs.ibl")
        end,
    }
}

return theme_plugins
