return {
  "amitds1997/remote-nvim.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("remote-nvim").setup({
      remote = {
        copy_dirs = {
          config = {
            base = vim.fn.stdpath("config"),
            dirs = {
              "init.lua",
              "lazy-lock.json",
              "lazyvim.json",
              "lua",
              ".stylua.toml",
            },
          },
        },
      },
    })
  end,
}
