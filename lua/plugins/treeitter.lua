local treesitter_playgroud = {
	"nvim-treesitter/playground",
}

local treesitter_context = {
	"nvim-treesitter/nvim-treesitter-context",
}

local treesitter_main = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	priority = 1000,
	build = ":TSUpdate",
}


local treesitter = {
	treesitter_main,
	treesitter_context,
	treesitter_playgroud,
}

return treesitter
