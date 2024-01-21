local config = function()
  -- require("neoconf").setup({})
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lspconfig = require("lspconfig")
  local opts = { noremap = true, silent = true }

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

  -- css server
  lspconfig.cssls.setup({
    capabilities = capabilities,
  })

  -- Svelte, SvelteKit
  lspconfig.svelte.setup({
    capabilities = capabilities,
    on_attach = function(client)
      vim.api.nvim_create_autocmd("BufWritePost", {
        patters = { "*.js", "*.ts" },
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
  })

  -- configure emmet language server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })

  vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)       -- show to definition
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) -- go to definition
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts) -- go to definition
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
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
