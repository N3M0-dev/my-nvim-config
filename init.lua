local conf_files = {
	"global.lua",
	"plugins.lua",
	"global.vim"
}

-- Here only config files of filetype .vim will be in the list, ohters are in the lua/plugin_conf, called by plugins.lua
local plugin_conf_files = {
	"markdown-preview_conf.vim"
}

-- source all the config files
for _, name in ipairs(conf_files) do
	local path = string.format("%s/conf/%s", vim.fn.stdpath("config"), name)
	local source_cmd = "source " .. path
	vim.cmd(source_cmd)
end

for _, name in ipairs(plugin_conf_files) do
	local path = string.format("%s/conf/plugins/%s", vim.fn.stdpath("config"), name)
	local source_cmd = "source " .. path
	vim.cmd(source_cmd)
end


require('onedark').setup {
	style = 'warmer'
}
require('onedark').load()
vim.cmd("hi TabLineSel guibg = #767a82")
