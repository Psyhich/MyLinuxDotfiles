
vim.g.ale_linters = {
	["python"] = {"pylint"},
	["c++"] = {"clang", "clangtidy", "cppcheck", "falwfinder"},
	["c"] = {"clang", "clangtidy", "cppcheck", "falwfinder"},
	["cs"] = {"OmniSharp"},
}

vim.g.ale_fixers = {
	['*'] = {"remove_trailing_lines', 'trim_whitespace"},
	['c'] = {"clang-format"},
	['cpp'] = {"clang-format"},
}

vim.g.ale_sign_error = "✗"
vim.g.ale_sign_warning = ""

vim.g.ale_cpp_clangtidy_checks = {}
vim.g.ale_cpp_clangtidy_executable = "clang-tidy"
vim.g.ale_c_parse_compile_commands = 1
vim.g.ale_cpp_clangtidy_extra_options = ''
vim.g.ale_cpp_clangtidy_options = ''
vim.g.ale_set_balloons = 1
vim.g.ale_linters_explicit = 1

