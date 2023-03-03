
local M = {}

M.config = function()
  local l = require("lspconfig")
  l.lua_ls.setup {}
end

return M
