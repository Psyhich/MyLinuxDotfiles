
local c_cpp_linters = {"clangtidy", "cppcheck", "flawfinder", "ccls"}
local c_cpp_fixers = {"clang-format", "clangtidy"}

vim.g.ale_linters = {
	["cpp"] = c_cpp_linters,
	["c"] = c_cpp_linters,
	["python"] = {"pylint"},
	["cs"] = {"OmniSharp"},
	["lua"] = {"sumneko_lua"}
}

vim.g.ale_fixers = {
	['*'] = {"remove_trailing_lines", "trim_whitespace"},
	['c'] = c_cpp_fixers,
	['cpp'] = c_cpp_fixers,
}

vim.g.ale_sign_error = ""
vim.g.ale_sign_warning = ""
vim.g.ale_sign_info = " "

vim.g.ale_cpp_clangtidy_checks = {}
vim.g.ale_cpp_clangtidy_executable = "clang-tidy"
vim.g.ale_c_parse_compile_commands = 1
vim.g.ale_linters_explicit = 1

