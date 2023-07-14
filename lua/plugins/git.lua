local lazygit = {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
}

local gitsigns = {
	"lewis6991/gitsigns.nvim",
}

local git = {
	gitsigns,
	lazygit,
}
return git
