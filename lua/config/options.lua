local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.swapfile = false
opt.undodir = vim.fn.expand("~/.nvim/undodir")
opt.undofile = true
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")
opt.clipboard:append("unnamedplus")
