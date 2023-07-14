local bufferline = {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
}

local lualine = {
	"nvim-lualine/lualine.nvim",
}

-- local scrollbar = {
-- 	"petertriho/nvim-scrollbar",
-- }

local vision = {
	bufferline,
	lualine,
	-- scrollbar,
}

return vision
