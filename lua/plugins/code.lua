local code_plugins = {
    {
        "SmiteshP/nvim-navic",
        opts = require("config.plugin_confs.navic")
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            local treesitter_opts = require("config.plugin_confs.nvim-treesitter")
            local config = require("nvim-treesitter.configs")
            config.setup(treesitter_opts)
        end
    },
    {
        "onsails/lspkind.nvim",
        opts = {}
    },
    { "williamboman/mason.nvim",          opts = {} },
    { "williamboman/mason-lspconfig.nvim" },
    { "lukas-reineke/lsp-format.nvim",    opts = {} },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("config.plugin_confs.nvim-lspconfig")
        end,
        dependencies = {
            { "folke/which-key.nvim" },
            { "onsails/lspkind.nvim" }
        }
    },
}

return code_plugins
