local M = {}

M.config = function()
  local t = require("telescope")
  t.load_extension('projects')
  t.setup{}
end

return M
