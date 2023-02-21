-- Bufferline
require("bufferline").setup({
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		numbers = "none",
		close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
		middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
		indicator = {
			icon = '▎', -- this should be omitted if indicator style is not 'icon'
			style = 'icon',
		},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = false,
		show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = false,
		show_tab_indicators = true,
		show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant",-- | "thick" | "thin" | { 'any', 'any' },
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
		sort_by = 'id'
	}
})

-- Tab manipulation
vim.keymap.set("n", "<C-M-W>", ":BufferLinePickClose<CR>")

vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
vim.keymap.set("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>")
