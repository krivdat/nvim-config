local config = function()
	require("lualine").setup({
		options = {
			theme = "nightfly",
    }
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}

