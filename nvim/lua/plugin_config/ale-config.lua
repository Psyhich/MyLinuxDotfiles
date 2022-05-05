
local c_cpp_linters =
{
	"cppcheck",
	"flawfinder",
	"clang-lint",
	"clang-check",
	"clang-format"
}

local c_cpp_fixers =
{
	"clang-format",
	"clangtidy"
}

vim.g.ale_linters = {
	["cpp"] = c_cpp_linters,
	["c"] = c_cpp_linters,
	["python"] = { "pylint" },
	["cs"] = { "OmniSharp" },
	["lua"] = { "sumneko_lua" }
}

vim.g.ale_fixers = {
	['*'] = {"remove_trailing_lines", "trim_whitespace"},
	['c'] = c_cpp_fixers,
	['cpp'] = c_cpp_fixers,
}

vim.g.ale_sign_error = ""
vim.g.ale_sign_warning = ""
vim.g.ale_sign_info = " "

-- If you are using lower clag-format version, I wish you luck with this https://stackoverflow.com/a/46374122
vim.g.ale_c_clangformat_executable = "clang-format-14"
vim.g.ale_c_clangformat_options = "-style=file:" .. vim.fn.stdpath('config') .. "/default_configs/.clang-format"
vim.g.ale_fix_on_save = true

-- vim.g.ale_cpp_clangtidy_checks = {}
-- vim.g.ale_cpp_clangtidy_executable = "clang-tidy"
vim.g.ale_c_parse_compile_commands = 1
vim.g.ale_linters_explicit = 1

