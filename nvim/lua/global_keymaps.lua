-- Save and close tabe
vim.api.nvim_set_keymap('n', '<C-S>', ':update<CR>', {})
vim.api.nvim_set_keymap('n', '<C-W>', ':bd<CR>', {})

-- Swap lines on Contol-k/j
require('lineswaper')
vim.g.BASH_Ctrl_j = 'off'
vim.api.nvim_set_keymap('n', '<C-k>', ':lua swap_up()<CR>', {})
vim.api.nvim_set_keymap('n', '<C-j>', ':lua swap_down()<CR>', {})
