local file_plugins = {
    {
        "nvim-tree/nvim-tree.lua",
        opts = require("config.plugin_confs.nvim-tree"),
        keys = require("config.keybindings").nvim_tree_keybindings,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = require("config.plugin_confs.telescope"),
        keys = require("config.keybindings").telescope_keybindings

    }
}

return file_plugins
