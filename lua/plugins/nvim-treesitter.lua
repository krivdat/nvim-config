return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	-- lazy = false,
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
        "c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"javascript",
				"typescript",
				"bash",
				"html",
				"json",
				"sql",
				"svelte",
				"yaml",
			},
			-- auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
