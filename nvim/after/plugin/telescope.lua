local telescope = require("telescope")
telescope.setup {
	defaults = {
		path_display = { "truncate" }
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
				width = 0.8,
				previewer = false,
				prompt_title = false,
				borderchars = {
					{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},
			}

		}
	},
}

telescope.load_extension("ui-select")

local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
vim.keymap.set("n", "<leader>lgf", builtin.live_grep, {})

