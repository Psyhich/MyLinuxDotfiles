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

function run_all()
	vim.cmd(":GTestName *")
	vim.cmd(":GTestRun")
end

map("n", "<leader>tsts", ":lua run_all()<CR>")
map("n", "<leader>curr", "<cmd>:GTestRunUnderCursor<CR>")

-- Configuring make keys
function make()
	local make_cmd = ":make"
	if BUILD_FOLDER then
		make_cmd = make_cmd .. " -C " .. BUILD_FOLDER
	end
	vim.cmd(make_cmd)
end

map("n", "<leader>mk", ":lua make()<CR>")
