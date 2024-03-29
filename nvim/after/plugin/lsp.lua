vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
vim.diagnostic.config(
{
	virtual_text = true,
	update_in_insert = true
})

-- Setting up nvim-cmp.
local luasnip = require 'luasnip'
local cmp = require 'cmp'

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	view = {
		entries = "custom"
	},
	formatting = {
		fields = { "kind", "abbr", "menu"},
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-s>'] = cmp.mapping.confirm({ select = true }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-p>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources(
		{
			{
				name = 'nvim_lsp',
				entry_filter = function(entry)
					return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
				end
			},
			{ name = 'luasnip' },
		},
		{
			{ name = 'buffer' },
			{ name = 'path' },
			{
				name = "dictionary",
				keyword_length = 2,
			},
		}),
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.recently_used,
			require("clangd_extensions.cmp_scores"),
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Firstly setting up Mason
-- then mason-autosetup
-- and after all manual LSP servers
require("mason").setup()
require("mason-lspconfig").setup(
	{
		ensure_installed = {
			"tsserver",
			"eslint",
			"lua_ls",
			"clangd",
			"omnisharp",
		}
	})

local function default_on_attach(client, bufnr)
	local builtin = require('telescope.builtin')
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

local function add_debuger_bindings(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)
	vim.keymap.set("n", "<leader>ds", ":DapStepOver<CR>", opts)
	vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", opts)
	vim.keymap.set("n", "<leader>do", ":DapStepOut<CR>", opts)
	vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", opts)
	vim.keymap.set("n", "<leader>dr", ":DapRestartFrame<CR>", opts)
	vim.keymap.set("n", "<leader>dt", ":DapTerminate<CR>", opts)
end

local function cpp_bindings(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	default_on_attach(client, bufnr)
	add_debuger_bindings(client, bufnr)

	vim.keymap.set("n", "<leader>ss", ":ClangdSwitchSourceHeader<CR>", opts)

	require("clangd_extensions.inlay_hints").setup_autocmd()
	require("clangd_extensions.inlay_hints").set_inlay_hints()
end

-- Set up lspconfig.
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.completion.snippetSupport = false

require("mason-lspconfig").setup_handlers {
	function (server_name) -- default handler
		require("lspconfig")[server_name].setup
			{
				on_attach = default_on_attach,
				capabilities = cmp_capabilities
			}
	end,
	["lua_ls"] = function ()
		require'lspconfig'.lua_ls.setup {
			capabilities = cmp_capabilities,
			on_attach = default_on_attach,
			settings = {
				Lua = {
					runtime = {
						version = 'LuaJIT',
					},
					diagnostics = {
						globals = {'vim'},
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}
	end,
	["clangd"] = function ()
		require("lspconfig").clangd.setup{
			capabilities = clangd_capabilities,
			on_attach = cpp_bindings,
			cmd =
			{
				"clangd",
				"--header-insertion=never",
				"--completion-style=detailed",
				"--background-index",
				"--clang-tidy",
				"--all-scopes-completion"
			}
		}
		require("clangd_extensions").setup({
			inlay_hints = {
				inline = true,
				-- Options other than `highlight' and `priority' only work
				-- if `inline' is disabled
				-- Only show inlay hints for the current line
				only_current_line = false,
				-- Event which triggers a refresh of the inlay hints.
				-- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
				-- not that this may cause  higher CPU usage.
				-- This option is only respected when only_current_line and
				-- autoSetHints both are true.
				only_current_line_autocmd = { "CursorHold" },
				-- whether to show parameter hints with the inlay hints or not
				show_parameter_hints = true,
				-- prefix for parameter hints
				parameter_hints_prefix = "<- ",
				-- prefix for all the other hints (type, chaining)
				other_hints_prefix = "=> ",
				-- whether to align to the length of the longest line in the file
				max_len_align = false,
				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,
				-- whether to align to the extreme right or not
				right_align = false,
				-- padding from the right if right_align is true
				right_align_padding = 7,
				-- The color of the hints
				highlight = "Comment",
				-- The highlight group priority for extmark
				priority = 100,
			},
			memory_usage = {
				border = "none",
			},
			symbol_info = {
				border = "none",
			},
		})
	end
}

require("lspconfig").hls.setup {
	capabilities = cmp_capabilities,
	on_attach = default_on_attach,
}

require("neodev").setup{
	library = { plugins = { "nvim-dap-ui" }, types = true },
}

