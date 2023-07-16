vim.keymap.set('n', '<C-q>', function()
	vim.cmd("q")
	require('dapui').close()
end)
