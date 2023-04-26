local telescope = require 'telescope'
telescope.setup({
    defaults={
	initial_mode='normal',
    }
})
telescope.load_extension('env')
telescope.load_extension('ui-select')
local vim = vim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
