local M = {}

M.config = function ()
  local indent_blankline = require("indent_blankline")
  indent_blankline.setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  }
end

return M
