local conf_files = {
	"global.vim",
	"global.lua",
	"plugins.lua"
}


-- source all the config files
for _, name in ipairs(conf_files) do
	local path = string.format("%s/conf/%s", vim.fn.stdpath("config"), name)
	local source_cmd = "source " .. path
	vim.cmd(source_cmd)
end


require('onedark').setup {
	style = 'warmer'
}
require('onedark').load()
