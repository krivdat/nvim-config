local config = function()
	-- require("neoconf").setup({})
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local on_attach = function ()
  local bufopts = { noremap = true, silent = true }
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, bufopts) -- show the definition
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts) -- go to definition
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts) -- go to definition
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- see available code actions
  end
  local lspconfig = require("lspconfig")

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
    on_attach = on_attach,
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
    on_attach = on_attach,
		settings = {
			implicitProjectConfiguration = {
				checkJs = true,
			},
		},
	})

	-- css server
	lspconfig.cssls.setup({
		capabilities = capabilities,
    on_attach = on_attach,
	})

	-- Svelte, SvelteKit
	lspconfig.svelte.setup({
		capabilities = capabilities,
    on_attach = on_attach,
		filetypes = { "svelte" },
		-- on_attach = function(client)
		-- 	vim.api.nvim_create_autocmd("BufWritePost", {
		-- 		patters = { "*.js", "*.cjs", "*.ts" },
		-- 		callback = function(ctx)
		-- 			if client.name == "svelte" then
		-- 				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
		-- 			end
		-- 		end,
		-- 	})
		-- end,
	})

	lspconfig.html.setup({
		capabilities = capabilities,
    on_attach = on_attach,
	})

	-- configure emmet language server
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
    on_attach = on_attach,
		filetypes = {
			"html",
			"javascript",
			"typescriptreact",
			"javascriptreact",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
		},
		init_options = {
			html = {
				options = {
					["bem.enabled"] = true,
				},
			},
		},
	})

end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
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
