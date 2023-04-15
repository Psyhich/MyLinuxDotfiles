vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
vim.diagnostic.config(
{
	virtual_text = true,
	update_in_insert = true
})

-- Setting up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	view = {
		entries = "custom"
	},
	formatting = {
		fields = { "kind", "abbr", "menu"},
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format(
				{mode = "symbol", maxwidth = 50})(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = strings[1] or ""

			return kind
		end,
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
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' }, -- For luasnip users.
		},
		{
			{ name = 'buffer' },
			{ name = 'path' },
			{
				name = "dictionary",
				keyword_length = 2,
			},
		})
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
			"pylsp",
			"clangd",
			"omnisharp",
		}
	})

local function default_on_attach(client, bufnr)
	local builtin = require('telescope.builtin')
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", "<cmd>:Lspsaga hover_doc ++quiet<CR>", opts)
	vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols, opts)
	vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	vim.keymap.set("n", "<leader>gr", builtin.lsp_references, opts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
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
	default_on_attach(client, bufnr)
	add_debuger_bindings(client, bufnr)
end

-- Set up lspconfig.
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
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
		require("clangd_extensions").setup
		{
			server = {
				capabilities = cmp_capabilities,
				on_attach = cpp_bindings,
				clangd =
				{
					arguments =
					{
						"--header-insertion=never",
						"--background-index",
						"--completion-style=detailed",
						"--sync"
					}
				}
			},
			extensions = {
				-- defaults:
				-- Automatically set inlay hints (type hints)
				autoSetHints = true,
				-- These apply to the default ClangdSetInlayHints command
				inlay_hints = {
					-- Only show inlay hints for the current line
					only_current_line = false,
					-- Event which triggers a refersh of the inlay hints.
					-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
					-- not that this may cause  higher CPU usage.
					-- This option is only respected when only_current_line and
					-- autoSetHints both are true.
					only_current_line_autocmd = "CursorHold",
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
				ast = {
					-- These are unicode, should be available in any font
					role_icons = {
						 type = "🄣",
						 declaration = "🄓",
						 expression = "🄔",
						 statement = ";",
						 specifier = "🄢",
						 ["template argument"] = "🆃",
					},
					kind_icons = {
						Compound = "C",
						Recovery = "R",
						TranslationUnit = "U",
						PackExpansion = "P",
						TemplateTypeParm = "T",
						TemplateTemplateParm = "T",
						TemplateParamObject = "T",
					},
					highlights = {
						detail = "Comment",
					},
				},
				memory_usage = {
					border = "none",
				},
				symbol_info = {
					border = "none",
				},
			},
		}
	end
}

-- local util = require "lspconfig.util"
-- require("ccls").setup(
-- 	{
-- 		filetypes = { "c", "cpp", "objc", "objcpp", "opencl" },
-- 		root_dir = function(fname)
-- 			return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
-- 			or util.find_git_ancestor(fname)
-- 		end,
-- 		init_options = {
-- 			cache =
-- 			{
-- 				vim.fs.normalize "~/.cache/ccls"
-- 			}
-- 		},
-- 		lsp = {
-- 			server = {
-- 				name = "ccls", --String name
-- 				cmd = {"/usr/bin/ccls"}, -- point to your binary, has to be a table
-- 				args = {--[[Any args table]] },
-- 				offset_encoding = "utf-32", -- default value set by plugin
-- 				root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]), -- or some other function that returns a string
-- 				on_attach = on_attach,
-- 				capabilites = cmp_capabilities
-- 			},
-- 			codelens = {
-- 				enable = true,
-- 				events = {"BufWritePost", "InsertLeave"}
-- 			},
-- 			-- Uncomment to enable coexistance with clangd
-- 			-- disable_capabilities = {
-- 			-- 	completionProvider = true,
-- 			-- 	documentFormattingProvider = true,
-- 			-- 	documentRangeFormattingProvider = true,
-- 			-- 	documentHighlightProvider = true,
-- 			-- 	documentSymbolProvider = true,
-- 			-- 	workspaceSymbolProvider = true,
-- 			-- 	renameProvider = true,
-- 			-- 	hoverProvider = true,
-- 			-- 	codeActionProvider = true,
-- 			-- },
-- 			-- disable_diagnostics = true,
-- 			-- disable_signature = true,
-- 		}
-- 	})
require("lspsaga").setup {}

require("neodev").setup{
	library = { plugins = { "nvim-dap-ui" }, types = true },
}

