return {
  "amitds1997/remote-nvim.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local config_path = vim.fn.stdpath("config")
    local all_dirs = vim.fn.readdir(config_path)
    local filtered_dirs = vim.tbl_filter(function(dir)
      local stat = vim.loop.fs_stat(config_path .. "/" .. dir)
      return stat and stat.type == "directory" and dir ~= ".git"
    end, all_dirs)

    require("remote-nvim").setup({
      remote = {
        copy_dirs = {
          config = {
            base = config_path,
            dirs = filtered_dirs,
          },
        },
      },
    })
  end,
}
