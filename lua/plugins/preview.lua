local preview_plugins = {
    -- {
    --   'chomosuke/typst-preview.nvim',
    --   lazy = false, -- or ft = 'typst'
    --   version = '1.*',
    --   build = function() require 'typst-preview'.update() end,
    -- }
    {
        "niuiic/typst-preview.nvim",
        ft = "typst",
        dependencies = { "neovim/nvim-lspconfig", "niuiic/core.nvim" },
        opts = {
            -- file opened by pdf viewer
            output_file = function()
                local core = require("core")
                return core.file.root_path() .. "/output.pdf"
            end,
            -- how to redirect output files
            redirect_output = function(original_file, output_file)
                vim.cmd(string.format("silent !ln -s %s %s", original_file, output_file))
            end,
            -- how to preview the pdf file
            preview = function(output_file)
                local core = require("core")
                core.job.spawn("xdg-open", {
                    output_file,
                }, {}, function() end, function() end, function() end)
            end,
            -- whether to clean all pdf files on VimLeave
            clean_temp_pdf = true,
        }
    }
}

return preview_plugins
