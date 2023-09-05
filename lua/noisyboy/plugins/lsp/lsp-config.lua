local lsp = require("lsp-zero")
local lspkind = require("lspkind")
local lspconfig = require("lspconfig")
local cmp = require('cmp')
local cmp_action = require("lsp-zero").cmp_action()
local luasnip = require("luasnip")
local lspkind = require("lspkind")

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

lsp.preset("recommended")
lsp.setup()

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local opts = { buffer = bufnr, remap = false }
    local keymap = vim.keymap
    keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- use enter key to confirm completion
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),      -- use cntrl+f to jump forward in luasnip
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),     -- use cntrl+b to jump backward in luasnip
    }),

    formatting = {
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
