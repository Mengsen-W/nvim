local telescope = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
}

local hlslens = {
	"kevinhwang91/nvim-hlslens",
}

local search = {
	telescope,
	hlslens,
}

return search
