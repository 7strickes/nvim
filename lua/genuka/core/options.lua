vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- Configure diagnostics in Neovim
vim.diagnostic.config({
  virtual_text = true, -- Show virtual text diagnostics inline
  signs = true, -- Show diagnostic signs in the sign column
  underline = true, -- Underline diagnostic text
  update_in_insert = true, -- Update diagnostics while in insert mode
})

-- Optionally, configure diagnostic signs (if not already configured)

-- tabs/indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
