local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then 
    print("can't require cmp")
    return 
end

local luasnip_setup, luasnip= pcall(require, "luasnip")
if not luasnip_setup then
    print("can't require luasnip")
    return 
end

local lspkind_setup, lspkind = pcall(require, "lspkind")
if not lspkind_setup then 
    print("can't require lspkind")
    return 
end

local lspconfig_setup, lspconfig = pcall(require, "lspconfig")
if not lspconfig_setup then 
    print("can't require lspconfig")
    return 
end

local cmp_nvim_lsp_setup, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_setup then 
    print("can't require cmp_nvim_lsp")
    return 
end
-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

cmp.setup({
  snippet = {
      expand = function(args)
          luasnip.lsp_expand(args.body)
      end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
  }, {
    { name = 'buffer' },
  })
})

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- setting up go language server(Gopls)
lspconfig['gopls'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        assign = true,
        atomic = true,
        bools = true,
        composites = true,
        copylocks = true,
        deepequalerrors = true,
        embed = true,
        errorsas = true,
        fieldalignment = true,
        httpresponse = true,
        ifaceassert = true,
        loopclosure = true,
        lostcancel = true,
        nilfunc = true,
        nilness = true,
        nonewvars = true,
        printf = true,
        shadow = true,
        shift = true,
        simplifycompositelit = true,
        simplifyrange = true,
        simplifyslice = true,
        sortslice = true,
        stdmethods = true,
        stringintconv = true,
        structtag = true,
        testinggoroutine = true,
        tests = true,
        timeformat = true,
        unmarshal = true,
        unreachable = true,
        unsafeptr = true,
        unusedparams = true,
        unusedresult = true,
        unusedvariable = true,
        unusedwrite = true,
        useany = true,
      },
      hoverKind = "FullDocumentation",
      linkTarget = "pkg.go.dev",
      usePlaceholders = true,
      vulncheck = "Imports",
    },
  },
}

-- setting up rust language server
local ok, rt = pcall(require, "rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})


sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- setting up lua lsp
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

-- setting up python lsp
lspconfig["pylsp"].setup({})

-- setting up yaml lsp
lspconfig["yamlls"].setup({})

-- setting up bash lsp
lspconfig["bashls"].setup({})

-- setting up docker lsp
lspconfig["dockerls"].setup({})

-- setting up docker-compose lsp
lspconfig["docker_compose_language_service"].setup({})
