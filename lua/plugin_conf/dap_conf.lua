local dap = require('dap')
-- require("mason-nvim-dap").setup({
-- 	ensure_installed = {},
-- 	handlers = {}
-- })

local dapui = require("dapui")
dapui.setup({
	controls = {
		element = "repl",
		enabled = true,
		icons = {
			disconnect = "",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = ""
		}
	},
	element_mappings = {},
	expand_lines = true,
	floating = {
		border = "single",
		mappings = {
			close = { "q", "<Esc>" }
		}
	},
	force_buffers = true,
	icons = {
		collapsed = "",
		current_frame = "",
		expanded = ""
	},
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.25
		}, {
			id = "breakpoints",
			size = 0.25
		}, {
			id = "stacks",
			size = 0.25
		}, {
			id = "watches",
			size = 0.25
		}, {
			id = "repl",
			size = 0.2
		}
		},
		position = "left",
		size = 40
	}, {
		elements = { {
			id = "console",
			size = 1
		} },
		position = "bottom",
		size = 10
	} },
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t"
	},
	render = {
		indent = 1,
		max_value_lines = 100
	}
}
)
vim.keymap.set('n', '<F5>', function()
	require('dapui').close()
	require('dapui').open()
	require('dap').continue()
end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp',
	function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)

dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	-- launch exe
	{
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",
		program = "${file}", -- This configuration will launch the current file if used.
		-- args = function()
		-- 	local input = vim.fn.input("Input args: ")
		-- 	return require("user.dap.dap-util").str2argtable(input)
		-- end,
		pythonPath = function()
			local venv_path = os.getenv("VIRTUAL_ENV")
			if venv_path then
				return venv_path .. "/bin/python"
			end
			return "/usr/bin/python"
		end,
		console = "integratedTerminal",
		-- console = "externalTerminal"
	}
}
dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = '/home/n3m0/Utils/codelldb/adapter/codelldb',
		args = { "--port", "${port}" },
		-- On windows you may have to uncomment this:
		-- detached = false,
	}
}
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}
dap.configurations.c = dap.configurations.cpp

dap.defaults.fallback.external_terminal = {
	command = '/usr/bin/alacritty',
	args = { '--hold', '-e' },
}

vim.keymap.set('n', '<C-q>', function()
	require('dapui').close()
	vim.cmd('q')
end)
