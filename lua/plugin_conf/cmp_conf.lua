local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup {
	snippet = {
		expand = function(args)
			-- For `ultisnips` user.
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm { select = true },
		["<C-e>"] = cmp.mapping.abort(),
		["<Esc>"] = cmp.mapping.close(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
	},
	sources = {
		{ name = "nvim_lsp" },               -- For nvim-lsp
		{ name = "ultisnips" },              -- For ultisnips user.
		{ name = "path" },                   -- for path completion
		{ name = "buffer",   keyword_length = 2 }, -- for buffer word completion
		{ name = "emoji",    insert = true }, -- emoji completion
	},
	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},
	view = {
		entries = "custom",
	},
	formatting = {
		format = lspkind.cmp_format {
			mode = "symbol_text",
			menu = {
				nvim_lsp = "[LSP]",
				ultisnips = "[US]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
				omni = "[Omni]",
			},
		},
	},
}


-- The following part is set in lsp_conf
--[[ -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
	capabilities = capabilities
} ]]
