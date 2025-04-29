return {
  "williamboman/mason.nvim",
  -- "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  optional = true,
  opts = {
    ensure_installed = {
      "codelldb",
    },
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        -- "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        -- "pyright",
        "ruff",
        "clangd",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        -- "isort", -- python formatter
        -- "black", -- python formatter
        -- "pylint",
        "eslint_d",
        "hadolint",
      },
    })
  end,
  --
  -- Mason-Nvim-DAP setup
  -- config = function()
  --   local mason_nvim_dap = require("mason-nvim-dap")
  --   mason_nvim_dap.setup({
  --     ensure_installed = {},
  --     automatic_installation = false,
  --     handlers = {
  --       function(config)
  --         -- all sources with no handler get passed here
  --         require("mason-nvim-dap").default_setup(config)
  --       end,
  --     },
  --   })
  -- end,
}
