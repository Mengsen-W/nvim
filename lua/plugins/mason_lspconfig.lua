local M = {}

M.config = function()
  local ml = require("mason-lspconfig")
  ml.setup{
    ensure_installed = { "lua_ls", "bashls", "clangd", "golangci_lint_ls", "gopls", "rust_analyzer" },
    automatic_installation = true,
  }
end

return M
