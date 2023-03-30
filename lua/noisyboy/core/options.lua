local opt = vim.opt

-- line numbers 
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4 -- indent length
opt.shiftwidth = 4 --auto indent length

-- line wrapping 
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true

-- gui
opt.termguicolors = true
opt.background = "dark"
opt.scl = "yes"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true


opt.iskeyword:append("-")

opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
