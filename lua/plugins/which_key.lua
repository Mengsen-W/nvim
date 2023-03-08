local M = {}

local normal_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local visual_opts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local normal_mappings = {
  e = {"<cmd>NeoTreeFloatToggle<cr>", "Explore"},
  p = {"<cmd>Telescope projects<cr>", "Projects"},
  t = {"<cmd>ToggleTerm<cr>", "terminal"},
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    c = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close", },
    x = { "<cmd>bd<CR>", "Close Buffer" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "Close all to the right" },
    D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
    L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
  },
  l = {
    name = "Lsp",
    d = {
      name = "diagnostic",
      e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Open Diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Preview Diagnostic" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      l = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Local Diagnostic" },
    },
  },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
}

local visual_mappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}

M.config = function()
  local wk = require("which-key")
  wk.setup({})
  wk.register(normal_mappings, normal_opts)
  wk.register(visual_mappings, visual_opts)
end

return M
