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
<<<<<<< HEAD

      use_default_keybindings = false,
      textobjects = {
        use_default_keybindings = true,
      },

      syntax_highlight = {
        enable = true,
      },

      -- Dim all cells except the current one
      -- Related command :JupyniumShortsightedToggle
=======
      use_default_keybindings = false,
      textobjects = { use_default_keybindings = true },
      syntax_highlight = { enable = true },
>>>>>>> d009d5334c63c64e01ae9c26f8e56327da63d343
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

<<<<<<< HEAD
    -- Please share your favourite settings on other colour schemes, so I can add defaults.
    -- Currently, tokyonight is supported.

    -- Set up custom keymaps
    local function set_default_keymaps(buf_id)
      vim.keymap.set({ "n", "x" }, "<space>jx", "<cmd>JupyniumExecuteSelectedCells<CR>", {
        buffer = buf_id,
        desc = "Jupynium execute selected cells",
      })
      vim.keymap.set({ "n", "x" }, "<space>c", "<cmd>JupyniumClearSelectedCellsOutputs<CR>", {
        buffer = buf_id,
        desc = "Jupynium clear selected cells",
      })
      vim.keymap.set("n", "<space>K", "<cmd>JupyniumKernelHover<cr>", {
        buffer = buf_id,
        desc = "Jupynium hover (inspect a variable)",
      })
      vim.keymap.set({ "n", "x" }, "<space>js", "<cmd>JupyniumScrollToCell<cr>", {
        buffer = buf_id,
        desc = "Jupynium scroll to cell",
      })
      vim.keymap.set({ "n", "x" }, "<space>jo", "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>", {
        buffer = buf_id,
        desc = "Jupynium toggle selected cell output scroll",
      })
      vim.keymap.set("", "<PageUp>", "<cmd>JupyniumScrollUp<cr>", {
        buffer = buf_id,
        desc = "Jupynium scroll up",
      })
      vim.keymap.set("", "<PageDown>", "<cmd>JupyniumScrollDown<cr>", {
        buffer = buf_id,
        desc = "Jupynium scroll down",
      })
      vim.keymap.set("n", "<space>jv", "<cmd>JupyniumStartSync<CR>", {
        buffer = buf_id,
        desc = "Jupynium start sync",
      })
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*.ju.*", -- or "jupyter" if Jupynium uses that
      callback = function(args)
        set_default_keymaps(args.buf)
      end,
    })
  end,
=======
    -- 🔑 Your custom keymaps
    local opts = { desc = "Jupynium", noremap = true, silent = true }
>>>>>>> d009d5334c63c64e01ae9c26f8e56327da63d343

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
