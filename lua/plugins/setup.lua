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
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },
  -- the colorscheme should be available when starting Neovim
  { 
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = require("plugins.tokyonight").config,
  },
  {
    "goolord/alpha-nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1001, -- make sure to load this before all the other start plugins
    config = require("plugins.alpha").config,
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
    cmd = { "NeoTreeFloatToggle"},
    event = "User DirOpened",
    config = require("plugins.neo_tree").config,
  },

  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = {
      "ToggleTerm",
      "TermExec",
      "ToggleTermToggleAll",
      "ToggleTermSendCurrentLine",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
    },
    version = "*",
    config = require("plugins.toggleterm").config,
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "nvim-lua/popup.nvim",
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
    lazy = true,
    event = "VimEnter",
    config = require("plugins.lualine").config,
  },
  {
    'akinsho/bufferline.nvim',
    branch = "main",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.bufferline").config,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "p00f/nvim-ts-rainbow",
    },
    lazy = true,
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    event = "User FileOpened",
    config = require("plugins.treesitter").config,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = require("plugins.indent_blankline").config,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true;
    event = "VeryLazy",
    config = require("plugins.autopairs").config,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    cmd = "Telescope",
    event = "VeryLazy",
    config = require("plugins.telescope").config,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "mason-lspconfig.nvim"},
    config = require("plugins.lspconfig").config,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "mason.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = { "LspInstall", "LspUninstall" },
    config = require("plugins.mason_lspconfig").config,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    event = "VeryLazy",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
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
    event = "VimEnter",
    cmd = "Telescope projects",
    config = require("plugins.project").config,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
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
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    config = require("plugins.cmp").config,
  },
  
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.gitsigns").config,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    config = require("plugins.comment").config,
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "neovim/nvim-lspconfig" },
    config = require("plugins.navic")
  },
})
