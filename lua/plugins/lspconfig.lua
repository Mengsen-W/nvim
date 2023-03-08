
local M = {}

local   mappings = {
  normal_mode = "n",
  insert_mode = "i",
  visual_mode = "v",
}

local buffer_mappings = {
  normal_mode = {
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto Definition" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" },
    ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
    ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
    ["gl"] = {
      function()
        local config = lvim.lsp.diagnostics.float
        config.scope = "line"
        vim.diagnostic.open_float(0, config)
      end,
      "Show line diagnostics",
    },
  },
  insert_mode = {},
  visual_mode = {},
}


M.config = function()
  local lspconfig = require("lspconfig")
  local util = require("lspconfig/util")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local navic = require("nvim-navic")


  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  -- local opts = { noremap=true, silent=true }
  -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    for mode_name, mode_char in pairs(mappings) do
      for key, remap in pairs(buffer_mappings[mode_name]) do
        local opts = { buffer = bufnr, desc = remap[2], noremap = true, silent = true }
        vim.keymap.set(mode_char, key, remap[1], opts)
      end
    end
    navic.attach(client, bufnr)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    -- vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, bufopts)
      -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      -- vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    -- lua
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- golang
    lspconfig.gopls.setup ({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {"gopls", "serve"},
      filetypes = {"go", "gomod"},
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })

  end

  return M
