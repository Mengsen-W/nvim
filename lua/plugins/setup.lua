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
  {
    "folke/tokyonight.nvim",
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
    config = require("plugins.whick_key").config,
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
    config = require("plugins.telescope").config,
  },
})
