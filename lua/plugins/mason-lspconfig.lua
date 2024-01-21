return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	config = function()
		require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"svelte",
				"lua_ls",
				"emmet_ls",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})
	end,
}
