-- packer setup
require("noisyboy.plugins-setup")

-- core settings
require("noisyboy.core.options")
require("noisyboy.core.colorscheme")
require("noisyboy.core.keymaps")

-- plugins
require("noisyboy.plugins.auto-save")
require("noisyboy.plugins.nvim-autopairs")
require("noisyboy.plugins.comment")
require("noisyboy.plugins.nvim-tree")
require("noisyboy.plugins.lua-line")
require("noisyboy.plugins.telescope")
require("noisyboy.plugins.nvim-cmp")
require("noisyboy.plugins.tree-sitter")
require("noisyboy.plugins.bufjump")
require("noisyboy.plugins.tabby")

-- lsp related plugins
require("noisyboy.plugins.lsp.mason")
require("noisyboy.plugins.lsp.lsp-config")

-- folding
require("noisyboy.plugins.nvim-ufo")
