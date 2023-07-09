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
	l = {
		name = "lsp",
		d = {
			name = "diagnostic",
			p = { vim.diagnostic.goto_prev, "goto prev" },
			n = { vim.diagnostic.goto_next, "goto next" },
			s = { vim.diagnostic.setloclist, "local list" },
			e = { vim.diagnostic.open_float, "open float" },
		},
		b = {
			name = "action",
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
			k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
			h = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
			t = { vim.lsp.buf.type_definition, "type definition" },
			R = { vim.lsp.buf.rename, "rename" },
			c = { vim.lsp.buf.code_action, "code action" },
			r = { vim.lsp.buf.references, "refeerences" },
			f = { vim.lsp.buf.format, "format" },
		},
		w = {
			name = "workspace",
			a = { vim.lsp.buf.add_workspace_folder, "add workspace" },
			r = { vim.lsp.buf.remove_workspace_folder, "remove workspace" },
			l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))", "list workspace" },
		},
	},
}

local visual_mapping = {
	["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}

which_key.register(normal_mapping, normal_opts)
which_key.register(visual_mapping, visual_opts)
