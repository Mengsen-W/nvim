local comment = require("Comment")

comment.setup({
	padding = true,
	sticky = true,
	mappings = {
		basic = false,
		extra = false,
	},
})

local surround = require("nvim-surround")

surround.setup({})
