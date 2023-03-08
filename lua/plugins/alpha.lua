local M = {}

M.config = function ()
  local alpha =  require("alpha")
  alpha.setup(require("alpha.themes.startify").config)
end

return M
