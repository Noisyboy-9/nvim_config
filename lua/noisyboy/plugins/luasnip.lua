local ok, luasnip = pcall(require, "luasnip")

local opts = { history = true, updateevents = "TextChanged,TextChangedI" }
luasnip.config.set_config(opts)

require("luasnip.loaders.from_vscode").lazy_load({})
require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.g.snipmate_snippets_path or "" })
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.g.lua_snippets_path or "" })

local types = require 'luasnip.util.types'

luasnip.config.setup({
    history = true,
    native_menu = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "GruvboxOrange" } },
            },
        },
    },
})
