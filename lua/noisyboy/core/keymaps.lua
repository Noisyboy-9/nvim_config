---@diagnostic disable: redefined-local
vim.g.mapleader = ","
local keymap = vim.keymap

-- visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- source settings
keymap.set("n", "<leader>ss", "<cmd>so ~/.config/nvim/init.lua<cr>", { silent = false })

-- general keymaps
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>")
keymap.set("n", "x", '"_x')


-- manage splits
keymap.set("n", "<leader>sv", "<C-w>v")         -- split verical
keymap.set("n", "<leader>sh", "<C-w>s")         -- spilt horizontal
keymap.set("n", "<leader>se", "<C-w>=")         -- make split windows equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close split window
keymap.set("n", "<leader>h", "<C-w>h")          -- go to left split window
keymap.set("n", "<leader>l", "<C-w>l")          -- go to right split window



-- manage tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")

-- jumping to files
keymap.set("n", "<leader>ev", "<cmd>tabnew ~/.config/nvim/init.lua<CR>")
keymap.set("n", "<leader>pack", "<cmd>tabnew ~/.config/nvim/lua/noisyboy/plugins-setup.lua<CR>")
keymap.set("n", "<leader>key", "<cmd>tabnew ~/.config/nvim/lua/noisyboy/core/keymaps.lua<CR>")

-- nvim-tree
keymap.set("n", "<leader>pe", "<cmd>NvimTreeToggle<CR>")


-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")  -- fuzzy find files
keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<CR>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- search file for pattern
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
keymap.set("n", "<leader>fp", "<cmd>Telescope workspaces<CR>")
keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>")
keymap.set("n", "<leader>fs", function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end) -- search all project for pattern
keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>")
keymap.set("v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    { noremap = true })


-- code folding
local ok, ufo = pcall(require, "ufo")
if not ok then
    print("can't require ufo")
    return
end
vim.keymap.set('n', 'zO', require('ufo').openAllFolds)
vim.keymap.set('n', 'zC', require('ufo').closeAllFolds)

-- trouble
local remapOpts = { silent = true, noremap = true }
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", remapOpts)
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", remapOpts)
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", remapOpts)
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", remapOpts)
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", remapOpts)
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", remapOpts)

--  lazygit
keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<cr>")


-- harpoon
local ok, harpoon = pcall(require, "harpoon")
if not ok then
    print("can't require harpoon from keymaps file")
    return
end
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap.set("n", "<leader>a", mark.add_file)
keymap.set("n", "<leader>fe", ui.toggle_quick_menu)


-- refactoring
keymap.set("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false })

vim.api.nvim_set_keymap("v", "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false })

vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
    { noremap = true, silent = true, expr = false })

vim.api.nvim_set_keymap("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
    { noremap = true, silent = true, expr = false })
