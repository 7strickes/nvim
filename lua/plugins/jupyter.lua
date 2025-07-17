return {
  "kiyoon/jupynium.nvim",
  dependencies = {
    "rcarriga/nvim-notify", -- optional
    "stevearc/dressing.nvim", -- optional
  },
  build = "pip3 install --user .",

  config = function()
    require("jupynium").setup({
      python_host = vim.g.python3_host_prog or "python3",
      default_notebook_URL = "localhost:8888/nbclassic",
      jupyter_command = "jupyter",
      notebook_dir = nil,
      firefox_profiles_ini_path = nil,
      firefox_profile_name = nil,
      auto_start_server = {
        enable = true,
        file_pattern = { "*.ju.*" },
      },
      auto_attach_to_server = {
        enable = true,
        file_pattern = { "*.ju.*", "*.md" },
      },
      auto_start_sync = {
        enable = true,
        file_pattern = { "*.ju.*", "*.md" },
      },
      auto_download_ipynb = false,
      auto_close_tab = true,
      autoscroll = {
        enable = true,
        mode = "always",
        cell = { top_margin_percent = 20 },
      },
      scroll = {
        page = { step = 0.5 },
        cell = { top_margin_percent = 20 },
      },
      jupynium_file_pattern = { "*.ju.*" },
      use_default_keybindings = false,
      textobjects = { use_default_keybindings = true },
      syntax_highlight = { enable = true },
      shortsighted = false,
      kernel_hover = {
        floating_win_opts = {
          max_width = 84,
          border = "none",
        },
      },
      notify = {
        ignore = {},
      },
    })

    -- 🔆 Custom highlights (optional)
    vim.cmd([[
      hi! link JupyniumCodeCellSeparator CursorLine
      hi! link JupyniumMarkdownCellSeparator CursorLine
      hi! link JupyniumMarkdownCellContent CursorLine
      hi! link JupyniumMagicCommand Keyword
    ]])

    -- 🔑 Your custom keymaps
    local opts = { desc = "Jupynium", noremap = true, silent = true }

    vim.keymap.set(
      "n",
      "<leader>jx",
      "<cmd>JupyniumExecuteSelectedCells<CR>",
      vim.tbl_extend("force", opts, { desc = "Execute cell" })
    )
    vim.keymap.set(
      "n",
      "<leader>jc",
      "<cmd>JupyniumClearSelectedCellsOutputs<CR>",
      vim.tbl_extend("force", opts, { desc = "Clear output" })
    )
    vim.keymap.set(
      "n",
      "<leader>jj",
      "<cmd>JupyniumScrollToCell<CR>",
      vim.tbl_extend("force", opts, { desc = "Scroll to cell" })
    )
    vim.keymap.set(
      "n",
      "<leader>jk",
      "<cmd>JupyniumScrollUp<CR>",
      vim.tbl_extend("force", opts, { desc = "Scroll up" })
    )
    vim.keymap.set(
      "n",
      "<leader>jl",
      "<cmd>JupyniumScrollDown<CR>",
      vim.tbl_extend("force", opts, { desc = "Scroll down" })
    )
    vim.keymap.set(
      "n",
      "<leader>js",
      "<cmd>JupyniumToggleSelectedCellsOutputsScroll<CR>",
      vim.tbl_extend("force", opts, { desc = "Toggle scroll output" })
    )
    vim.keymap.set(
      "n",
      "<leader>jr",
      "<cmd>JupyniumKernelRestart<CR>",
      vim.tbl_extend("force", opts, { desc = "Restart kernel" })
    )
    vim.keymap.set(
      "n",
      "<leader>ji",
      "<cmd>JupyniumKernelInterrupt<CR>",
      vim.tbl_extend("force", opts, { desc = "Interrupt kernel" })
    )
    vim.keymap.set(
      "n",
      "<leader>jh",
      "<cmd>JupyniumKernelHover<CR>",
      vim.tbl_extend("force", opts, { desc = "Hover inspect" })
    )

    -- 🧠 Optional: restore textobjects ([j, ]j, vij, etc.)
    -- require("jupynium.textobj").default_keybindings()
  end,
}
