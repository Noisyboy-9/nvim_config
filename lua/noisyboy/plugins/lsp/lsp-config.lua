local ok, lsp = pcall(require, "lsp-zero")
lsp.preset({})
lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

local ok, cmp = pcall(require, "cmp")
local cmp_action = lsp.cmp_action()
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	mapping = {
		["<C-n>"] = cmp_action.luasnip_jump_forward(),
		["<C-p>"] = cmp_action.luasnip_jump_backward(),
	},
})

lsp.setup()
