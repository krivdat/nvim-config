return {
 "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 999,
  config = function ()
    vim.cmd.colorscheme "catppuccin"
  end
}
