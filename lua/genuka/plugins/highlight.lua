return {
  "brenoprata10/nvim-highlight-colors",
  config = function()
    vim.opt.termguicolors = true
    local highlight = require("nvim-highlight-colors")
    highlight.setup({
      render = "foreground",
    })
  end,
}
