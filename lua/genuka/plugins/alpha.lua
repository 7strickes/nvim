return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Custom Header (Optional)
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Custom Buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find File", ":Telescope find_files <CR>"),
      dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("g", "  Find Text", ":Telescope live_grep <CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
      dashboard.button("c", "  Config", "<cmd>Telescope find_files cwd=~/.config/nvim<CR>"),
      dashboard.button("s", "  Restore Session", "<cmd>SessionRestore<CR>"),
      -- dashboard.button("x", "  Lazy Extras", ":LazyExtras <CR>"),
      dashboard.button("l", "󰒲  Lazy", ":Lazy <CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Custom Footer
    -- dashboard.section.footer.val = {
    --   "⚡ Neovim loaded "
    --     .. require("lazy").stats().loaded
    --     .. "/"
    --     .. require("lazy").stats().count
    --     .. " plugins in "
    --     .. string.format("%.2f", require("lazy").stats().startuptime)
    --     .. "ms",
    -- }
    dashboard.section.header.opts.hl = "AlphaHeader"
    -- Hide status line when Alpha is open
    -- vim.api.nvim_create_autocmd("User", {
    --   pattern = "AlphaReady",
    --   callback = function()
    --     vim.opt.laststatus = 0 -- Hide status line
    --   end,
    -- })

    -- Restore status line when leaving Alpha
    -- vim.api.nvim_create_autocmd("BufUnload", {
    --   pattern = "<buffer>",
    --   callback = function()
    --     vim.opt.laststatus = 2 -- Restore status line
    --   end,
    -- })
    -- alpha.setup(dashboard.config)
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
}
