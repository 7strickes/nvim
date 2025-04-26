vim.g.mapleader = " "
local keymap = vim.keymap -- for conciseness

-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- clangd configs
keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch Source/Header (C/C++)" })

-- clangd extentions commands
keymap.set("n", "<leader>cc", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "actvate" })
keymap.set("v", "<leader>cA", "<cmd>ClangdAST<CR>", { desc = "Adanced syntax tree" })
keymap.set("n", "<leader>ci", "<cmd>ClangdSymbolInfo<CR>", { desc = "Show Clangd Symbol Info" })
keymap.set("n", "<leader>ct", "<cmd>ClangdTypeHierarchy<CR>", { desc = "type hierarchy" })
keymap.set("n", "<leader>cm", "<cmd>:ClangdMemoryUsage<CR>", { desc = "current memory use" })
keymap.set("n", "<leader>cM", "<cmd>ClangdMemoryUsage expand_preamble<CR>", { desc = "full memory usage" })

-- window management

keymap.set("n", "<leader>s", "", { desc = "Split menu" }) -- split window vertically
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sl", "<C-w>h", { desc = "Move to left split" }) -- make split windows equal width & height
keymap.set("n", "<leader>sr", "<C-w>l", { desc = "Move to right split" }) -- make split windows equal width & height
keymap.set("n", "<leader>su", "<C-w>k", { desc = "Move to top split" }) -- make split windows equal width & height
keymap.set("n", "<leader>sd", "<C-w>j", { desc = "Move to bottom split" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>t", "", { desc = "tab menu" }) -- open new tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  mve current buffer to new tab

keymap.set("n", "<leader>a", "<cmd>Alpha<CR>", { desc = "go home" })
