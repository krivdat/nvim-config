return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
		vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=None]])
    local nvimTree = require("nvim-tree")
    nvimTree.setup({
			filters = {
				dotfiles = false,
			},
		})
    nvimTree.disable_netrw = false
    nvimTree.hijack_netrw = true
	end,
}
