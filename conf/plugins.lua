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
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = [[require('plugin_conf.surround_conf')]]
	})
	use {
		'numToStr/Comment.nvim',
		config = [[require('plugin_conf.comment_conf')]]
	}
	use { 'ibhagwan/fzf-lua',
		-- optional for icon support
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = [[require('plugin_conf.fzf-lua_conf')]]
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } },
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
	use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
	use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
	use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
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
	use { "SirVer/ultisnips", event = "InsertEnter" }
	use { "honza/vim-snippets", after = "ultisnips" }

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
	use {
		"folke/which-key.nvim",
		event = "VimEnter",
	}
	use "lukas-reineke/lsp-format.nvim"
	use 'navarasu/onedark.nvim'
end)
