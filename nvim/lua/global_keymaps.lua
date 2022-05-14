
vim.g.mapleader = " "
-- Save and close tab
map('n', '<C-S>', ':update<CR>', {})

-- Swap lines on Contol-Shift-k/j
require('lineswaper')
vim.g.BASH_Ctrl_j = 'off'
map('n', '<C-k>', ':lua swap_up()<CR>', {})
map('n', '<C-j>', ':lua swap_down()<CR>', {})

-- Moving between tabs
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")

-- Tab splitting
map("n", "<C-M-h>", ":split<CR>")
map("n", "<C-M-v>", ":vsplit<CR>")
