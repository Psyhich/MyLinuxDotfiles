DATA_PATH = vim.fn.stdpath('data')

-- Shortcut for mapping

function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require('global_configs')
require("global_keymaps")
require("plugins")
