-- Highlight
require("nvim-treesitter.configs").setup {
	ensure_installed = {
		-- Configs
		"json",
		"yaml",
		"toml",
		"cmake",
		"make",
		-- Compilant langs
		"c",
		"cpp",
		"c_sharp",
		"haskell",
		"java",
		"latex",
		"rust",
		-- Interpreted langs
		"bash",
		"python",
		"javascript",
		"lua",
		"vim",

		--
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.html.filetype = {"html", "csp"}

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
