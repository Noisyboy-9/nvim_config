vim.g.mapleader = ","
local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")
keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
keymap.set("n", "x", '"_x')


-- manage splits 
keymap.set("n", "<leader>sv", "<C-w>v") -- split verical
keymap.set("n", "<leader>sh", "<C-w>s") -- spilt horizontal
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal size
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window
keymap.set("n", "<leader>h", "<C-w>h") -- go to left split window
keymap.set("n", "<leader>l", "<C-w>l") -- go to right split window



-- manage tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- jumping to files
keymap.set("n", "<leader>ev", ":tabnew ~/.config/nvim/init.lua<CR>")
keymap.set("n", "<leader>pack", ":tabnew ~/.config/nvim/lua/noisyboy/plugins-setup.lua<CR>")
keymap.set("n", "<leader>key", ":tabnew ~/.config/nvim/lua/noisyboy/core/keymaps.lua<CR>")

-- nvim-tree
keymap.set("n", "<leader>pe", ":NvimTreeToggle<CR>")


-- telescope 
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") -- fuzzy find files
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>") -- search all project for pattern
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>") -- search file for pattern
keymap.set("n", "<leader>fe", ":Telescope buffers<CR>") -- recently opened file
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
keymap.set("n", "<leader>fp", ":Telescope project<CR>")


-- lsp keymaps 
local bufopts = { noremap=true, silent=true, buffer=bufnr }
keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)



-- code folding 
local ok, ufo = pcall(require, "ufo")
if not ok then
   print("can't require ufo")
    return
end
keymap.set("n", "zR", ufo.openAllFolds)
keymap.set("n", "zM", ufo.closeAllFolds)

