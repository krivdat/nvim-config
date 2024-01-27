return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
	},
  config = function()
	-- require("neoconf").setup({})
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local opts = { noremap = true, silent = true }
  local on_attach = function (client, bufnr)
    opts.buffer = bufnr
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts) -- show the definition
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- go to definition
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts) -- go to definition
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- see available code actions
  end
  local lspconfig = require("lspconfig")

  -- bash
  lspconfig.bashls.setup({
		capabilities = capabilities,
    on_attach = on_attach,
    })

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
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      	vim.api.nvim_create_autocmd("BufWritePost", {
      		pattern = { "*.js", "*.cjs", "*.ts" },
      		callback = function(ctx)
      			if client.name == "svelte" then
      				client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
      			end
      		end,
      	})
		end,
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

}
