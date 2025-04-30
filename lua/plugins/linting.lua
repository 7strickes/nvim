return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      dockerfile = { "hadolint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Disable specific linters for Python when LSP is active

    -- local function is_lap_active()
    --     local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
    --     return #clients > 0
    -- end
    --
    -- local function disable_linter_for_python()
    --     if is_lap_active() then
    --         lint.linters_by_ft["python"] = {}
    --     else
    --         lint.linters_by_ft["python"] = { "pylint" }
    --     end
    -- end
    -- -- Call this function in the `BufEnter` event
    -- vim.api.nvim_create_autocmd("BufEnter", {
    --     pattern = "*.py",
    --     callback = disable_linter_for_python,
    -- })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
