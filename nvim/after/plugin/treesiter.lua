-- Highlight
require("nvim-treesitter.configs").setup {
	ensure_installed = {
		"json",
		"yaml",
		"toml",
		"cmake",
		"make",

		"c",
		"cpp",
		"c_sharp",
		"haskell",
		"java",
		"latex",
		"rust",

		"bash",
		"python",
		"javascript",
		"lua",
		"vim",

		"html"
	},
	highlight =
	{
		enable = true
	},
	indent =
	{
		enable = false
	}
}
require'treesitter-context'.setup{
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
	line_numbers = true,
	multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
	trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
	-- Separator between context and content. Should be a single character string, like '-'.
	-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
	separator = nil,
	zindex = 20, -- The Z-index of the context window
}

require("nvim-treesitter.configs").setup {
	rainbow =
	{
		colors =
		{
			"#C64D5C",
			"#2E67C0",
			"#F09241",
			"#285577"
		},
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	}
}
