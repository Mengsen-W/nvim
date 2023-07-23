local lualine = require("lualine")
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = ">", right = "<" },
		section_separators = { left = "|>", right = "<|" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "filename" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "filesize", "fileformat", "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

local bufferline = require("bufferline")
bufferline.setup({})

local trouble = require("trouble")
trouble.setup({})

local noice = require("noice")
noice.setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

local scrollbar = require("scrollbar")
scrollbar.setup({
show = true,
handle = {
	text = " ",
	color = "#928374",
	hide_if_all_visible = true,
},
marks = {
	Search = { color = "yellow" },
	Misc = { color = "purple" },
},
handlers = {
	cursor = false,
	diagnostic = true,
	gitsigns = true,
	handle = true,
	search = true,
},
})
