return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  config = function()
    -- Ensure that mason-nvim-dap is loaded before using it
    local mason_nvim_dap = require("mason-nvim-dap")

    -- Setup mason-nvim-dap
    mason_nvim_dap.setup({
      ensure_installed = { "stylua", "jq" },
      handlers = {
        function(config)
          -- All sources with no handler get passed here
          require("mason-nvim-dap").default_setup(config) -- Keep original functionality
        end,
      },
    })
  end,
}
