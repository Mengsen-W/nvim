vim.o.foldmethod = "expr"
-- Default to treesitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.diagnostic.config({
      underline = true,
      update_in_insert = false,
      virtual_text = true,
      severity_sort = true,
    })
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    -- inlay hint
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(false) -- default for close
    end

    Snacks.keymap.set("n", "<leader>cl", function() Snacks.picker.lsp_config() end, { desc = "Lsp Info" })
    Snacks.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "goto definition" })
    Snacks.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
    Snacks.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
    Snacks.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
    Snacks.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
    Snacks.keymap.set("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
    Snacks.keymap.set("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
    Snacks.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
    Snacks.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
    Snacks.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    Snacks.keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "CodeLens" })
    Snacks.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "rename" })
    Snacks.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, { desc = "format" })
    Snacks.keymap.set({ "n" }, "<leader>cC", vim.lsp.codelens.refresh, { desc = "CodeLens refresh" })

    -- for clangd
    Snacks.keymap.set(
      { "n" },
      "<leader>co",
      "<cmd>LspClangdSwitchSourceHeader<CR>",
      { ft = { "c", "cpp", "objc", "objcpp", "cuda" }, desc = "switch source/header" }
    )
    Snacks.keymap.set(
      { "n" },
      "<leader>cs",
      "<cmd>LspClangdShowSymbolInfo<CR>",
      { ft = { "c", "cpp", "objc", "objcpp", "cuda" }, desc = "clangd showsymbol" }
    )
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
--   callback = function(args)
--     -- Highlight words under cursor
--     -- if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) and vim.bo.filetype ~= 'bigfile' then
--     --   local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
--     --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {:lua vim.print(vim.tbl_keys(vim.lsp.handlers))

--     --     buffer = event.buf,
--     --     group = highlight_augroup,
--     --     callback = vim.lsp.buf.document_highlight,
--     --   })
--     --
--     --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--     --     buffer = event.buf,
--     --     group = highlight_augroup,
--     --     callback = vim.lsp.buf.clear_references,
--     --   })
--     --
--     --   vim.api.nvim_create_autocmd("LspDetach", {
--     --     group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
--     --     callback = function(event_2)
--     --       vim.lsp.buf.clear_references()
--     --       vim.api.nvim_clear_autocmds { group = "lsp-highlight", buffer = event_2.buf }
--     --     end,
--     --   })
--     --
--     -- end
--   end
-- })
