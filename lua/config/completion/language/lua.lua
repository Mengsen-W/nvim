local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({
	on_attach = function()
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace"
			}
		}
	}
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.completion.luasnip,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.formatting.lua_format,
		-- null_ls.builtins.diagnostics.luacheck,
		-- null_ls.builtins.diagnostics.selene,
	},
})
