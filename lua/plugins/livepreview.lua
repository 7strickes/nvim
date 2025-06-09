return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    -- You can choose one of the following pickers
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    vim.o.autowriteall = true
    vim.api.nvim_create_autocmd({ "InsertLeavePre", "TextChanged", "TextChangedP" }, {
      pattern = "*",
      callback = function()
        vim.cmd("silent! write")
      end,
    })
  end,
  require("livepreview.config").set({
    port = 5173,
    browser = "open -a 'Google Chrome'",
    dynamic_root = false,
    sync_scroll = true,
    picker = "telescope",
  }),
}
