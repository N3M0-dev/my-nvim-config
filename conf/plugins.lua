return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use { "lewis6991/impatient.nvim" }
	use { 'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
		config = [[require('plugin_conf.treesitter_conf')]]
	}
	use {
		"folke/which-key.nvim",
		event = "VimEnter",
		config = [[require('plugin_conf.which-key_conf')]],
	}
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		-- config = [[require('plugin_conf.surround_conf')]]
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	})
	use {
		'numToStr/Comment.nvim',
		config = [[require('plugin_conf.comment_conf')]]
	}
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = {
			{ 'nvim-lua/popup.nvim',                      'LinArcX/telescope-env.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{ 'nvim-lua/plenary.nvim' },
		},
		config = [[require('plugin_conf.telescope_conf')]]
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = [[require('plugin_conf.lualine_conf')]]
	}
	use { 'anuvyklack/pretty-fold.nvim',
		config = [[require('plugin_conf.pretty-fold_conf')]]
	}
	use {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = [[require('plugin_conf.copilot_conf')]]
	}
	use { "williamboman/mason.nvim",
		run = ":MasonUpdate", -- :MasonUpdate updates registry contents
		config = [[require('plugin_conf.mason_conf')]]
	}
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'liuchengxu/vista.vim' }
	use { 'fgheng/winbar.nvim' }
	use { 'lervag/vimtex' }
	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	use { 'dhruvasagar/vim-table-mode' }
	use { 'godlygeek/tabular' }
	use { 'preservim/vim-markdown' }
	use { 'KeitaNakamura/tex-conceal.vim' }
	use { "onsails/lspkind-nvim", event = "VimEnter" }
	-- auto-completion engine
	use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('plugin_conf.cmp_conf')]] }

	-- nvim-cmp completion sources
	use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
	use { "hrsh7th/cmp-path", after = "nvim-cmp" }
	use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
	use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
	use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }
	use {
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end
	}
	use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" }, config =
	[[require('plugin_conf.cmp_ultisnips_conf')]] }
	use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('plugin_conf.lsp_conf')]] }
	use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }
	use {
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
	}
	use {
		"rcarriga/nvim-notify",
		event = "BufEnter",
	}
	-- Snippet engine and snippet template
	use { "SirVer/ultisnips", event = "VimEnter" }

	-- Automatic insertion and deletion of a pair of characters
	use { "Raimondi/delimitMate", event = "InsertEnter" }
	use { "nvim-zh/better-escape.vim", event = { "InsertEnter" } }
	use({
		"gbprod/yanky.nvim",
	})
	use { "chrisbra/unicode.vim", event = "VimEnter" }
	use { "wellle/targets.vim", event = "VimEnter" }
	use { "andymass/vim-matchup", event = "VimEnter" }
	use { "tpope/vim-scriptease", cmd = { "Scriptnames", "Message", "Verbose" } }
	use { "gelguy/wilder.nvim" }

	use "lukas-reineke/lsp-format.nvim"
	use 'navarasu/onedark.nvim'
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		config = [[require('plugin_conf.navic_conf')]]
	}
	use 'folke/neodev.nvim'
	use { "jay-babu/mason-nvim-dap.nvim" }
	use { 'mfussenegger/nvim-dap', after = { "nvim-lspconfig" }, config =
	[[require('plugin_conf.dap_conf')]] }
	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = [[require('plugin_conf.neo_tree_conf')]]
	}
	use { "akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end }
	use 'h-hg/fcitx.nvim'
	use { 'kaarmu/typst.vim', ft = { 'typst' } }
end)
