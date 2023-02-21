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
require('detect-language').setup{}

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
