return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "html",
        "css",
        "scss",
        "json",
      },
    },
  },
}