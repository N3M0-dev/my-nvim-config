local status_line_plugins = {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = require("config.plugin_confs.lualine")
    },
    {
        "ramilito/winbar.nvim",
        event = "VimEnter", -- Alternatively, BufReadPre if we don't care about the empty file when starting with 'nvim'
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
}

return status_line_plugins
