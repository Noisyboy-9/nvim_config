local ok, cmp = pcall(require, "cmp")
if not ok then
    print("can't require nvim-cmp")
    return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
    print("can't require luasnip")
    return
end

require('luasnip/loaders/from_vscode').lazy_load()

vim.opt.completeopt= {"menu", "menuone", "noselect"}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])



cmp.setup({
    snippet = {
        expand = function (args) 
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<Space>k"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<Space>j"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<Space>b"] = cmp.mapping.scroll_docs(-4),
        ["<Space>f"] = cmp.mapping.scroll_docs(4),
        ["<Space><Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    }),

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name= "nvim_lsp_signature_help" },
        { name= "nvim_lua" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "calc" }
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})
