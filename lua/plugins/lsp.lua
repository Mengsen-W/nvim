return {
  {
    "mason-org/mason-lspconfig.nvim",
    -- event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    event = "VeryLazy",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      { "neovim/nvim-lspconfig" },
    },
  },
}
