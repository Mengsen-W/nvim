local lsp_config = {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "ray-x/lsp_signature.nvim", },
	},
}

local cmp = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			dependencies = {
				{"rafamadriz/friendly-snippets"},
			},
			build = "make install_jsregexp"

		},
		{ "lukas-reineke/cmp-under-comparator" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "andersevenrud/cmp-tmux" },
		{ "hrsh7th/cmp-path" },
		{ "f3fora/cmp-spell" },
		{ "hrsh7th/cmp-buffer" },
		{ "kdheepak/cmp-latex-symbols" },
		{ "ray-x/cmp-treesitter" },
	},
}

local null_ls = {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "jay-babu/mason-null-ls.nvim" },
	},
}

local completion = {
	lsp_config,
	cmp,
	null_ls,
}

--completion["nvimdev/lspsaga.nvim"] = {
--	lazy = true,
--	event = "LspAttach",
--	-- config = require("completion.lspsaga"),
--	dependencies = { "nvim-tree/nvim-web-devicons" },
--}

return completion
