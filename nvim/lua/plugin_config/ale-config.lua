
vim.g.ale_linters = {
	["python"] = "pylint",
	["c++"] = {"clang", "clangtidy"},
	["c"] = {"clang", "clangtidy"},
	["cs"] = "OmniSharp",
	--["lua"] = "sumneko_lua"
}

vim.g.ale_fixers = {
	['c'] = "clang-format",
	['cpp'] = "clang-format",
	['*'] = {"remove_trailing_lines', 'trim_whitespace"},
}

vim.g.ale_cpp_clangtidy_checks = {}
vim.g.ale_cpp_clangtidy_executable = "clang-tidy"
vim.g.ale_c_parse_compile_commands = 1
vim.g.ale_cpp_clangtidy_extra_options = ''
vim.g.ale_cpp_clangtidy_options = ''
vim.g.ale_set_balloons = 1
vim.g.ale_linters_explicit = 1

