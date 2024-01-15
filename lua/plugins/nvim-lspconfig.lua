local config = function()
	require("neoconf").setup({})
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local lspconfig = require("lspconfig")

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- typescript, javascript
	lspconfig.tsserver.setup({
		capabilities = capabilities,
	})

	lspconfig.html.setup({
		capabilities = capabilities,
	})

	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {}) -- show to definition
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {}) -- go to definition
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {}) -- go to definition
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- see available code actions
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
