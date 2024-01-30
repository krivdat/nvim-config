local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Directory Navigation
keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Management 
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Cycle through buffers
keymap.set("n", "<leader>.", ":bnext<CR>", opts)
keymap.set("n", "<leader>,", ":bprevious<CR>", opts)

-- Quick close buffers
keymap.set("n", "<leader>q", ":q<CR>", opts)
keymap.set("n", "<leader>w", ":wq<CR>", opts) -- save and quit
