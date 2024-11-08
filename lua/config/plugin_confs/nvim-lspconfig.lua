local navic_on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

local format_on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client, bufnr)
end

local on_attach_fun = function(client, bufnr)
  navic_on_attach(client, bufnr)
  format_on_attach(client, bufnr)
end

local lspconfig = require("lspconfig")
local cmp = require('cmp')
local luasnip = require("luasnip")
local lspkind = require("lspkind")

vim.opt.pumheight = 20

cmp.setup({
  preselect = cmp.PreselectMode.None,
  complete = {
    completeopt = menu, menuone, noinsert, noselect
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.get_selected_entry() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
          })
        end
      else
        fallback()
      end
    end),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping.complete()
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50,              -- leading text (labelDetails)
        abbr = 50,              -- actual suggestion item
      },
      ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]] --

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Set up lspconfig.
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME .. "${3rd}/luv/library"
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        },
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
    })
  end,
  on_attach = on_attach_fun,
  settings = {
    Lua = {}
  }
}

lspconfig.clangd.setup {
  capabilities = cmp_capabilities,
  on_attach = on_attach_fun
}

lspconfig.pylyzer.setup {
  capabilities = cmp_capabilities,
  settings = {
    python = {
      checkOnType = true,
      diagnostics = true,
      inlayHints = true,
      smartCompletion = true
    }
  }
}

-- lspconfig.java_language_server.setup {
--   capabilities = cmp_capabilities,
--   on_attach = on_attach_fun,
--   filetypes = { "java" },
--   cmd = { "/home/nemo/.local/share/nvim/mason/packages/java-language-server/dist/lang_server_linux.sh" }
-- }

lspconfig.jdtls.setup {}

lspconfig.bashls.setup {}

lspconfig.rust_analyzer.setup {}

-- lspconfig.typst_lsp.setup {
--   capabilities = cmp_capabilities,
--   on_attach = on_attach_fun,
--   settings = {
--     exportPdf = "onSave"
--   }
-- }

require 'lspconfig'.tinymist.setup {
  capabilities = cmp_capabilities,
  on_attach = on_attach_fun,
  settings = {
    exportPdf = "onSave",
    -- semanticTokens = "disable"
  }
}

require("config.keybindings").lsp_keybindings()
