local better_escape_opt = {
    timeout = vim.o.timeoutlen / 2,
    -- default_mappings = true,
    mappings = {
        i = {
            h = {
                -- These can all also be functions
                h = "<Esc>",
            },
        },
        c = {
            h = {
                h = "<Esc>",
            },
        },
        t = {
            h = {
                h = "<C-\\><C-n>",
            },
        },
        v = {
            h = {
                h = "<Esc>",
            },
        },
        s = {
            h = {
                h = "<Esc>",
            },
        },
    },
}

return better_escape_opt
