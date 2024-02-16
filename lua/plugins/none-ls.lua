return {
  "nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
          extra_filetypes = { "svelte" }
        }),
        -- null_ls.builtins.diagnostics.eslint_d,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
