local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- the colorscheme should be available when starting Neovim
  { "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = require("plugins.tokyonight").config,
  },

  -- I have a separate config.mappings file where I require which-key.
  -- With lazy the plugin will be automatically loaded when it is required somewhere
  { 
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.which_key").config,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.neo_tree").config,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.noice").config,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    config = require("plugins.lualine").config,
  },
  {
    'akinsho/bufferline.nvim',
    config = require("plugins.bufferline").config,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "p00f/nvim-ts-rainbow",
    },
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.treesitter").config,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.telescope").config,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.lspconfig").config,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.mason_lspconfig").config,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.mason").config,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.null_ls").config,
  },
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.project").config,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",

      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",

      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      "SirVer/ultisnips",
      "quangnguyen30192/cmp-nvim-ultisnips",

      "dcampos/nvim-snippy",
      "dcampos/cmp-snippy",
    },
    config = require("plugins.cmp_lsp").config,
  },
})
