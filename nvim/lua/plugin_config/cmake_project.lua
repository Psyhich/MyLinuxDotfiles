-- Getting project dir
local util = require("lspconfig/util")
local cmake_project_root = (util.root_pattern("CMakeLists.txt"))(vim.fn.expand('%:p'))
if cmake_project_root then
	require('telescope').load_extension('cmake4vim')

	-- Base configs
	vim.g.cmake_src_dir = cmake_project_root
	vim.g.cmake_build_dir = cmake_project_root .. "/build"
	vim.g.cmake_compile_commands = 1
	vim.g.cmake_compile_commands_link = cmake_project_root
	vim.g.cmake_build_target = "all"

	-- Test strategy
	vim.g["test#strategy"] = "neomake"

	-- Galaxyline
	local gl = require("galaxyline")
	local gls = gl.section
	local colors = require("galaxyline.themes.colors").default
	gls.left[11] = {
		CMakeBuildTarget = {
			provider =
				function()
					return " " .. vim.g.cmake_build_target
				end,
			highlight = {colors.white, colors.bg},
		}
	}

	-- Mappings
	map("n", "<leader>cg", ":CMake<CR>")
	map("n", "<leader>cb", ":CMakeBuild<CR>")
	map("n", "<leader>cs", ":Telescope cmake4vim select_target<CR>")
end
