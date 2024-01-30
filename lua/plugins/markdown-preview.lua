return {
  "iamcco/markdown-preview.nvim",
  cmd = {
    "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"
  },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function ()
    vim.g.mkdp_theme = "dark"
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", {})
    vim.keymap.set("n", "<leader>mc", ":MarkdownPreviewStop<CR>", {})
  end
  }
