return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "rebelot/kanagawa.nvim" },
  -- { "EdenEast/nightfox.nvim" },
  { "marko-cerovac/material.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { transparent_background = true } },
  -- { "projekt0n/github-nvim-theme", name = "github-theme" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
