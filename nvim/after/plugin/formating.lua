-- Utilities for creating configurations
local util = require "formatter.util"

local function clang_format()
	return {
		exe = "clang-format",
		args = { },
		stdin = true,
	}
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		cpp = {clang_format},
		json = {clang_format},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace
		}
	}
}
