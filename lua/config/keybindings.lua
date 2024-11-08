local keybindings = {}

-- keybindings.leap_keybindings = function()
-- 	vim.keymap.set('l', '<Plug>(leap)')
-- 	vim.keymap.set('L', '<Plug>(leap-from-window)')
-- 	vim.keymap.set({ 'x', 'o' }, 'l', '<Plug>(leap-forward)')
-- 	vim.keymap.set({ 'x', 'o' }, 'L', '<Plug>(leap-backward)')
-- end

keybindings.vim_keybindings = function()
	vim.keymap.set({ 'n' }, "<C-q>", function() vim.cmd("q") end)
	vim.keymap.set({ 'n' }, "<Leader>w", function() vim.cmd("w") end)
end

keybindings.which_key_bindings = {
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	},
}

keybindings.nvim_tree_keybindings = {
	{ "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "Toggel Nvim Tree" }
}

local _, builtin = pcall(require, "telescope.builtin")

keybindings.telescope_keybindings = {
	{ '<leader>ff', builtin.find_files, desc = 'Telescope find files' },
	{ '<leader>fg', builtin.live_grep,  desc = 'Telescope live grep' },
	{ '<leader>fb', builtin.buffers,    desc = 'Telescope buffers' },
	{ '<leader>fh', builtin.help_tags,  desc = 'Telescope help tags' }
}

local status, wk = pcall(require, "which-key")
keybindings.lsp_keybindings = function()
	if status then
		wk.add({
			{
				"<Leader>l",
				mode = { "n" },
				group = "LSP"
			},
			{
				"<Leader>la",
				function()
					vim.lsp.buf.code_action()
				end,
				mode = { "n" },
				desc = "Code Actions"
			},
			{
				"<Leader>lgd",
				function()
					vim.lsp.buf.definition()
				end,
				mode = { "n" },
				desc = "Goto Definition"
			},
			{
				"<Leader>lgD",
				function()
					vim.lsp.buf.declaration()
				end,
				mode = { "n" },
				desc = "Goto Decraration"
			},
			{
				"<Leader>lgi",
				function()
					vim.lsp.buf.implementation()
				end,
				mode = { "n" },
				desc = "Goto Implementation"
			},
			{
				"<Leader>le",
				function()
					vim.diagnostic.open_float()
				end
			},
			{
				-- should not be here
				"<Leader>p",
				group = "Preview"
			},
			{
				"<Leader>pt",
				function()
					local _, typst = pcall(require, "typst-preview")
					typst.preview()
				end,
				desc = "Typst Preview"
			}
		})
	else
		print("which-key not loaded")
	end
end
return keybindings
