vim.g.mapleader = " "

local which_key = require("which-key")
which_key.setup({})

local normal_opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
	expr = false, -- use `expr` when creating keymaps
}

local visual_opts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
	expr = false, -- use `expr` when creating keymaps
}

local normal_mapping = {
	["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
	h = { "<cmd>noh<cr>", "no highlight" },
	e = { "<cmd>Neotree<cr>", "expore file" },
	b = {
		name = "buffer",
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		c = { "<cmd>bd<cr>", "buffer kill" },
		f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
		b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
		n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
		e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
		h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
		l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
		D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
		L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
	},
	l = {
		name = "lsp",
		h = {
			name = "diagnostic",
			p = { vim.diagnostic.goto_prev, "goto prev" },
			n = { vim.diagnostic.goto_next, "goto next" },
			s = { vim.diagnostic.setloclist, "local list" },
			e = { vim.diagnostic.open_float, "open float" },
		},
		t = { "<cmd>TroubleToggle<cr>", "trouble" },
		d = { vim.lsp.buf.definition, "definition" },
		D = { vim.lsp.buf.declaration, "declaration" },
		k = { vim.lsp.buf.hover, "hover" },
		i = { vim.lsp.buf.implementation, "implemention" },
		s = { vim.lsp.buf.signature_help, "show signature help" },
		p = { vim.lsp.buf.type_definition, "type definition" },
		R = { vim.lsp.buf.rename, "rename" },
		c = { vim.lsp.buf.code_action, "code action" },
		r = { vim.lsp.buf.references, "refeerences" },
		f = { vim.lsp.buf.format, "format" },
		w = {
			name = "workspace",
			a = { vim.lsp.buf.add_workspace_folder, "add workspace" },
			r = { vim.lsp.buf.remove_workspace_folder, "remove workspace" },
			l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))", "list workspace" },
		},
	},

	s = {
		name = "search",
		f = { "<cmd>Telescope find_files<cr>", "find files" },
		g = { "<cmd>Telescope live_grep<cr>", "live grep" },
		b = { "<cmd>Telescope buffers<cr>", "buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "help tags" },
	},

	g = {
		name = "git",
		l = { "<cmd>LazyGit<cr>", "lazy git" },
		n = { "<cmd>Gitsigns next_hunk<cr>", "next hunk" },
		p = { "<cmd>Gitsigns prev_hunk<cr>", "prev hunk" },
		b = { "<cmd>Gitsigns blame_line<cr>", "blame line" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "reset_hunk" },
		h = { "<cmd>Gitsigns preview_hunk_inline<cr>", "preview hunk inline" },
	},
	F = {
		name = "fun",
		r = { "<cmd>CellularAutomaton make_it_rain<CR>", "make it rain" },
	},
	P = {
		name = "Package Manager",
		l = { "<cmd>Lazy<cr>", "lazy nvim" },
		m = { "<cmd>Mason<cr>", "Mason" },
		n = { "<cmd>NullLsInfo<cr>", "Null Ls Info" },
	},
	R = { "<cmd>so $MYVIMRC<cr>", "reload config" },
}

local visual_mapping = {
	["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}

which_key.register(normal_mapping, normal_opts)
which_key.register(visual_mapping, visual_opts)
