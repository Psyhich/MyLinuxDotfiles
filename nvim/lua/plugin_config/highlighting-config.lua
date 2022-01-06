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
	},
	highlight = {
		enable = true
	},
	indent = {
		enable = true
	}
}

-- Tags support
vim.g.easytags_cmd = "ctags-universal"
vim.g.easytags_dynamic_files = 1
vim.g.easytags_opts = {
	"--languages=all"
}
