require("plugin_config/coq-config")
require("plugin_config/commenter-config")

require("nvim-autopairs").setup
{
	enable_check_bracket_line = false,
	fast_wrap = {},
}

-- Configuring gtest
vim.g["gtest#highlight_failing_tests"] = 1
-- Setting default tests executable
local util = require("lspconfig/util")
local build_folder = (util.root_pattern("build"))(vim.fn.expand('%:p'))

if build_folder ~= nil then
	vim.g["gtest#gtest_command"] = build_folder .. "/build/tests"
end
map("n", "<leeader>curr", "<cmd>:GTestRunUnderCursor<CR>")

