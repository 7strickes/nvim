return {
  "scottmckendry/cyberdream.nvim",
  priority = 1000,
  config = function()
    local transparent = true
    local border = "#547998"
    local bg = "#011628"
    local bg_dark = "#011423"
    local bg_highlight = "#143652"
    local bg_search = "#0A64AC"
    local bg_visual = "#275378"
    local fg = "#CBE0F0"
    local fg_dark = "#B4D0E9"
    local fg_gutter = "#627E97"

    require("cyberdream").setup({
      transparent = transparent,
      on_colors = function(colors)
        colors.border = border
        colors.bg = bg
        colors.bg_dark = transparent and colors.none or bg_dark
        colors.bg_float = transparent and colors.none or bg_dark
        colors.bg_highlight = bg_highlight
        colors.bg_popup = bg_dark
        colors.bg_search = bg_search
        colors.bg_sidebar = transparent and colors.none or bg_dark
        colors.bg_statusline = transparent and colors.none or bg_dark
        colors.bg_visual = bg_visual
        colors.border = border
        colors.fg = fg
        colors.fg_dark = fg_dark
        colors.fg_float = fg
        colors.fg_gutter = fg_gutter
        colors.fg_sidebar = fg_dark
      end,
      extensions = {
        telescope = true,
        notify = true,
        mini = true,
      },
    })
    vim.cmd("colorscheme cyberdream")
  end,

  -- "folke/tokyonight.nvim",
  -- priority = 1000,
  -- config = function()
  --   local transparent = true -- set to true if you would like to enable transparency
  --
  --   local bg = "#011628"
  --   local bg_dark = "#011423"
  --   local bg_highlight = "#143652"
  --   local bg_search = "#0A64AC"
  --   local bg_visual = "#275378"
  --   local fg = "#CBE0F0"
  --   local fg_dark = "#B4D0E9"
  --   local fg_gutter = "#627E97"
  --   local border = "#547998"
  --
  --   require("tokyonight").setup({
  --     style = "night",
  --     transparent = transparent,
  --     styles = {
  --       sidebars = transparent and "transparent" or "dark",
  --       floats = transparent and "transparent" or "dark",
  --     },
  --     on_colors = function(colors)
  --       colors.bg = bg
  --       colors.bg_dark = transparent and colors.none or bg_dark
  --       colors.bg_float = transparent and colors.none or bg_dark
  --       colors.bg_highlight = bg_highlight
  --       colors.bg_popup = bg_dark
  --       colors.bg_search = bg_search
  --       colors.bg_sidebar = transparent and colors.none or bg_dark
  --       colors.bg_statusline = transparent and colors.none or bg_dark
  --       colors.bg_visual = bg_visual
  --       colors.border = border
  --       colors.fg = fg
  --       colors.fg_dark = fg_dark
  --       colors.fg_float = fg
  --       colors.fg_gutter = fg_gutter
  --       colors.fg_sidebar = fg_dark
  --     end,
  --   })
  --
  --   -- Force bold for selected highlight groups after the colorscheme is set
  --   vim.cmd("colorscheme tokyonight")
  --
  --   -- Apply bold to selected highlight groups while preserving the original colors
  --   -- local bold_groups = {
  --   --   "Normal",
  --   --   "Comment",
  --   --   "Character",
  --   --   "Statement",
  --   --   "Function",
  --   --   "Keyword",
  --   --   "Type",
  --   --   "Identifier",
  --   --   "String",
  --   --   "Number",
  --   --   "Constant",
  --   --   "PreProc",
  --   --   "Error",
  --   --   "Warning",
  --   --   "Directory",
  --   --   "Special",
  --   --   "@variable",
  --   --   "@function",
  --   --   "@function.call",
  --   --   "@parameter",
  --   --   "@field",
  --   --   "@property",
  --   --   "@keyword",
  --   --   "@constant",
  --   --   "@number",
  --   --   "@string",
  --   --   "@operator",
  --   -- }
  --   --
  --   -- for _, group in ipairs(bold_groups) do
  --   --   -- Preserve existing settings for each group and apply bold
  --   --   local existing = vim.api.nvim_get_hl(0, { name = group, link = false })
  --   --   if existing then
  --   --     vim.api.nvim_set_hl(0, group, { bold = true, fg = existing.fg, bg = existing.bg })
  --   --   end
  --   -- end
  --   -- vim.api.nvim_set_hl(0, "pythonFunction", { bold = true }) -- Force bold for functionsvim
  --   -- vim.api.nvim_set_hl(0, "pythonIdentifier", { bold = true })
  -- end,
}
