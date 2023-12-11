local keymap = vim.keymap

-- Directory Navigation
keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
