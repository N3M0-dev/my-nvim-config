local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#9C4B51" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#A08656" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#437AA7" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#B17338" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6A8854" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#9565A4" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#44919B" })
end)

require("ibl").setup { indent = { highlight = highlight } }


local test = {
    1,
        2,
            3,
                4,
                    5,
                        6,
                            7,
                            }
