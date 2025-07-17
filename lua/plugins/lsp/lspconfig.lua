return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "p00f/clangd_extensions.nvim",
  },
  opts = {
    servers = {
      tsserver = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
      vtsls = {
        -- explicitly add default filetypes, so that we can extend
        -- them in related extras
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        settings = {
          complete_function_calls = true,
          vtsls = {
            enableMoveToFileCodeAction = true,
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 30,
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = false },
            },
          },
        },
        keys = {
          {
            "gD",
            function()
              local params = vim.lsp.util.make_position_params()
              LazyVim.lsp.execute({
                command = "typescript.goToSourceDefinition",
                arguments = { params.textDocument.uri, params.position },
                open = true,
              })
            end,
            desc = "Goto Source Definition",
          },
          {
            "gR",
            function()
              LazyVim.lsp.execute({
                command = "typescript.findAllFileReferences",
                arguments = { vim.uri_from_bufnr(0) },
                open = true,
              })
            end,
            desc = "File References",
          },
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
          {
            "<leader>cM",
            LazyVim.lsp.action["source.addMissingImports.ts"],
            desc = "Add missing imports",
          },
          {
            "<leader>cu",
            LazyVim.lsp.action["source.removeUnused.ts"],
            desc = "Remove unused imports",
          },
          {
            "<leader>cD",
            LazyVim.lsp.action["source.fixAll.ts"],
            desc = "Fix all diagnostics",
          },
          {
            "<leader>cV",
            function()
              LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
            end,
            desc = "Select TS workspace version",
          },
        },
      },
      -- python setup
      -- ruff = {
      --   cmd_env = { RUFF_TRACE = "messages" },
      --   init_options = {
      --     settings = {
      --       logLevel = "error",
      --     },
      --   },
      -- },
      -- ruff_lsp = {
      --   keys = {
      --     {
      --       "<leader>co",
      --       LazyVim.lsp.action["source.organizeImports"],
      --       desc = "Organize Imports",
      --     },
      --   },
      -- },
      -- tailwindcss = {
      --   -- exclude a filetype from the default_config
      --   filetypes_exclude = { "markdown" },
      --   -- add additional filetypes to the default_config
      --   filetypes_include = {},
      --   -- to fully override the default_config, change the below
      --   -- filetypes = {}
      -- },
      terraformls = {},
      ruff = {
        cmd_env = { RUFF_TRACE = "messages" },
        init_options = {
          settings = {
            logLevel = "error",
          },
        },
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
      ruff_lsp = {
        keys = {
          {
            "<leader>co",
            LazyVim.lsp.action["source.organizeImports"],
            desc = "Organize Imports",
          },
        },
      },
      -- docker setup
      dockerls = {},
      docker_compose_language_service = {},
      -- Ensure mason installs the server
      clangd = {
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
          ) or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
    },
    setup = {
      tsserver = function()
        -- disable tsserver
        return true
      end,
      ts_ls = function()
        -- disable tsserver
        return true
      end,
      vtsls = function(_, opts)
        LazyVim.lsp.on_attach(function(client, buffer)
          client.commands["_typescript.moveToFileRefactoring"] = function(command, ctx)
            ---@type string, string, lsp.Range
            local action, uri, range = unpack(command.arguments)

            local function move(newf)
              client.request("workspace/executeCommand", {
                command = command.command,
                arguments = { action, uri, range, newf },
              })
            end

            local fname = vim.uri_to_fname(uri)
            client.request("workspace/executeCommand", {
              command = "typescript.tsserverRequest",
              arguments = {
                "getMoveToRefactoringFileSuggestions",
                {
                  file = fname,
                  startLine = range.start.line + 1,
                  startOffset = range.start.character + 1,
                  endLine = range["end"].line + 1,
                  endOffset = range["end"].character + 1,
                },
              },
            }, function(_, result)
              ---@type string[]
              local files = result.body.files
              table.insert(files, 1, "Enter new path...")
              vim.ui.select(files, {
                prompt = "Select move destination:",
                format_item = function(f)
                  return vim.fn.fnamemodify(f, ":~:.")
                end,
              }, function(f)
                if f and f:find("^Enter new path") then
                  vim.ui.input({
                    prompt = "Enter move destination:",
                    default = vim.fn.fnamemodify(fname, ":h") .. "/",
                    completion = "file",
                  }, function(newf)
                    return newf and move(newf)
                  end)
                elseif f then
                  move(f)
                end
              end)
            end)
          end
        end, "vtsls")
        -- copy typescript settings to javascript
        opts.settings.javascript =
          vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})
      end,
    },
    clangd = function(_, opts)
      local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
      require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
      return false
    end,
    ruff = function()
      LazyVim.lsp.on_attach(function(client, _)
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end, ruff)
    end,
    -- tailwindcss = function(_, opts)
    --   local tw = LazyVim.lsp.get_raw_config("tailwindcss")
    --   opts.filetypes = opts.filetypes or {}
    --
    --   -- Add default filetypes
    --   vim.list_extend(opts.filetypes, tw.default_config.filetypes)
    --
    --   -- Remove excluded filetypes
    --   --- @param ft string
    --   opts.filetypes = vim.tbl_filter(function(ft)
    --     return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
    --   end, opts.filetypes)
    --
    --   -- Additional settings for Phoenix projects
    --   opts.settings = {
    --     tailwindCSS = {
    --       includeLanguages = {
    --         elixir = "html-eex",
    --         eelixir = "html-eex",
    --         heex = "html-eex",
    --       },
    --     },
    --   }
    --
    --   -- Add additional filetypes
    --   vim.list_extend(opts.filetypes, opts.filetypes_include or {})
    -- end,
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local diagnostic_goto = function(next, severity)
      local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        go({ severity = severity })
      end
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", diagnostic_goto(true), opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", diagnostic_goto(false), opts) -- jump to next diagnostic in buffer

        opts.desc = "Go to next error"
        keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), opts) -- jump to next diagnostic in buffer

        opts.desc = "Go to next warning"
        keymap.set("n", "]w", diagnostic_goto(true, "WARN"), opts) -- jump to next diagnostic in buffer

        opts.desc = "Go to prev error"
        keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), opts) -- jump to next diagnostic in buffer

        opts.desc = "Go to prev warning"
        keymap.set("n", "[w", diagnostic_goto(false, "WARN"), opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    -- local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticError", numhl = "DiagnosticError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticWarn", numhl = "DiagnosticWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "󰥟", texthl = "DiagnosticInfo", numhl = "DiagnosticInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticHint", numhl = "DiagnosticHint" })

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
