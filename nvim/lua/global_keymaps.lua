vim.g.mapleader = " "
-- Save and close tab
vim.keymap.set('n', '<C-S>', ':update<CR>')

-- Swap lines on Contol-Shift-k/j
-- require('lineswaper')
vim.g.BASH_Ctrl_j = 'off'
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Moving between tabs
vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>")

vim.keymap.set("n", "<leader>bd", ":bd<CR>")

-- Tab splitting
vim.keymap.set("n", "<C-M-h>", ":split<CR>")
vim.keymap.set("n", "<C-M-v>", ":vsplit<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

