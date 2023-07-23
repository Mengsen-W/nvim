-- lsp config

-- neodev
local neodev = require("neodev")
neodev.setup({})

-- lspsaga
local lspsaga = require("lspsaga")
lspsaga.setup({
	lightbulb = {
		virtual_text = false,
	},
})

-- mason
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
mason_lspconfig.setup({
	ensure_installed = { "lua_ls" },
	automatic_installation = true,
})

-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.lua_format,
		-- null_ls.builtins.diagnostics.luacheck,
		-- null_ls.builtins.diagnostics.selene,

		null_ls.builtins.diagnostics.revive,
		null_ls.builtins.formatting.goimports,
		-- null_ls.builtins.code_actions.impl,
		-- null_ls.builtins.diagnostics.gospel,
		-- null_ls.builtins.diagnostics.golangci_lint,
		null_ls.builtins.formatting.gofmt,
	},
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		-- local opts = { buffer = ev.buf }
		-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		-- vim.keymap.set('n', '<space>wl', function()
		--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		-- end, opts)
		-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- vim.keymap.set('n', '<space>f', function()
		--   vim.lsp.buf.format { async = true }
		-- end, opts)
	end,
})

local lspconfig = require("lspconfig")
local lspconfig_utils = require("lspconfig.util")
lspconfig_utils.default_config.capabilities = vim.tbl_deep_extend(
	"force",
	lspconfig.util.default_config.capabilities,
	require("cmp_nvim_lsp").default_capabilities(),
	{}
)
lspconfig.lua_ls.setup({
	on_attach = function() end,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

lspconfig.gopls.setup({})
lspconfig.intelephense.setup({})
lspconfig.clangd.setup({
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
		"--all-scopes-completion",
		"--background-index",
		"--clang-tidy",
		"--clang-tidy-checks=performance-*, bugprone-*, misc-*, google-*, modernize-*, readability-*, portability-*",
		"--compile-commands-dir=${workspaceFolder}/.vscode",
		"--completion-parse=auto",
		"--completion-style=detailed",
		"--enable-config",
		"--fallback-style=Google",
		"--function-arg-placeholders=true",
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--include-cleaner-stdlib",
		"--log=verbose",
		"--pch-storage=memory",
		"--pretty",
		"--ranking-model=decision_forest",
		"-j=12",
	},
})
