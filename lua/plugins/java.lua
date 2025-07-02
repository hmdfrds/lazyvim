return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "java",
        "groovy",
        "kotlin", -- If you use Kotlin with Spring Boot
        "gradle",
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}