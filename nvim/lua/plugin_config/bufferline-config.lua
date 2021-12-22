-- Bufferline
require("bufferline").setup{}

vim.api.nvim_set_keymap('n', '<C-S-Right>', ':BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':BufferLineCyclePrev<CR>', {})
