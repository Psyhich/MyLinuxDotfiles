DATA_PATH = vim.fn.stdpath('data')

require('global_configs')
require("global_keymaps")
require("plugins")

-- Completion

-- Linting
vim.g.ale_linters = {
    ["python"] = "pylint",
    ["vim"] = "vint",
    ["c++"] = "clang",
    ["c"] = "clang",
	["cs"] = "OmniSharp"
}

-- Highlight
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}, indent={enable = true}}

-- Telescope
require('telescope')

-- Indentline configuration
vim.g.indentLine_char = "|"
vim.g.indentLine_fileTypeExclude = {"text", "markdown", "help"}
vim.g.indentLine_bufNameExclude = {"STARTIFY", "NVIMTREE"}
vim.g.indent_blankline_extra_indent_level = -1
