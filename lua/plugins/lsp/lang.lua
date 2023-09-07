local M = {}

M.servers = {
  jsonls = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  clangd = {
    keys = {
      { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    },
    root_dir = function(fname)
      return require("lspconfig.util").root_pattern(
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja"
      )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
        fname
      ) or require("lspconfig.util").find_git_ancestor(fname)
    end,
    capabilities = {
      offsetEncoding = { "utf-16" },
    },
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
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
  },
  gopls = {
    keys = {
      -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
      { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
    },
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          fieldalignment = true,
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
    },
  },
  rust_analyzer = {
    keys = {
      { "K",          "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
      { "<leader>cR", "<cmd>RustCodeAction<cr>",   desc = "Code Action (Rust)" },
      { "<leader>dr", "<cmd>RustDebuggables<cr>",  desc = "Run Debuggables (Rust)" },
    },
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        -- Add clippy lints for Rust.
        checkOnSave = {
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  },
  taplo = {
    keys = {
      {
        "K",
        function()
          if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
            require("crates").show_popup()
          else
            vim.lsp.buf.hover()
          end
        end,
        desc = "Show Crate Documentation",
      },
    },
  },
}


M.setup = {
  clangd = function(_, opts)
    local clangd_ext_opts = require("util").opts("clangd_extensions.nvim")
    require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
    return true
  end,
  gopls = function(_, opts)
    -- workaround for gopls not supporting semanticTokensProvider
    -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
    require("util").on_attach(function(client, _)
      if client.name == "gopls" then
        if not client.server_capabilities.semanticTokensProvider then
          local semantic = client.config.capabilities.textDocument.semanticTokens
          client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = {
              tokenTypes = semantic.tokenTypes,
              tokenModifiers = semantic.tokenModifiers,
            },
            range = true,
          }
        end
      end
    end)
    -- end workaround
  end,
  rust_analyzer = function(_, opts)
    local rust_tools_opts = require("util").opts("rust-tools.nvim")
    require("rust-tools").setup(vim.tbl_deep_extend("force", rust_tools_opts or {}, { server = opts }))
    return true
  end,
}

M.null_ls = function()
  local nls = require("null-ls")
  return {
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
    sources = {
      nls.builtins.formatting.fish_indent,
      nls.builtins.diagnostics.fish,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      nls.builtins.diagnostics.revive,
      nls.builtins.code_actions.gomodifytags,
      nls.builtins.code_actions.impl,
      nls.builtins.formatting.gofumpt,
      nls.builtins.formatting.goimports_reviser,
      -- nls.builtins.diagnostics.flake8,
    },
  }
end

M.mason_ensure_install = {
  "stylua",
  "shfmt",
  "clangd", "codelldb",
  "gopls", "gomodifytags", "impl", "gofumpt", "goimports-reviser", "delve",
  "rust-analyzer", "taplo",
  -- "flake8",
}

return M
