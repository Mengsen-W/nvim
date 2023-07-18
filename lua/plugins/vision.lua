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
--
local trouble = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

local noice = {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}

local vision = {
	bufferline,
	lualine,
	trouble,
	noice,
	-- scrollbar
}

return vision
