local remote_plugins = {
    -- 'chipsenkbeil/distant.nvim',
    -- branch = 'v0.3',
    -- config = function()
    --     require('distant'):setup()
    -- end
    {
        "nosduco/remote-sshfs.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            -- Refer to the configuration section below
            -- or leave empty for defaults
        },
    }
}

return remote_plugins
