vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.o.timeoutlen = 500
vim.o.scrolloff = 10
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- for dvorak key mapping
vim.keymap.set({ 'n', 'v', 'o' }, "l", "<Nop>")
vim.keymap.set({ 'n', 'v', 'o' }, "s", "<Right>")

-- vim.keymap.set({'n'}, "<C-q>", function() vim.cmd("q") end)
-- vim.keymap.set({'n'}, "<Leader>w", function() vim.cmd("w") end)

vim.opt.listchars = { eol = '$', lead = '·', tab = '>-', trail = '~', extends = '>', precedes = '<', nbsp = '-' }
vim.opt.list = true
