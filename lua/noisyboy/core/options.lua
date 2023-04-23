local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 4 -- indent length
opt.shiftwidth = 4 --auto indent length
opt.softtabstop = 4

-- undo tree have access to long running undos
opt.swapfile = false
opt.backup= false
opt.undodir= os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true


-- line wrapping
opt.wrap = false

-- search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- cursor
opt.cursorline = true
opt.scrolloff = 12

-- gui
opt.termguicolors = true
opt.background = "dark"
opt.scl = "yes"
opt.updatetime = 50

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- folding
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- spell checker
opt.spelllang = 'en_us'
opt.spell = true

