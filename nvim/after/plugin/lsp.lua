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

local function on_attach(client, bufnr)
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

-- Set up lspconfig.
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup_handlers {
	function (server_name) -- default handler
		require("lspconfig")[server_name].setup
			{
				on_attach = on_attach,
				capabilities = cmp_capabilities
			}
	end,
	["lua_ls"] = function ()
		require'lspconfig'.lua_ls.setup {
			capabilities = cmp_capabilities,
			on_attach = on_attach,
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
	end
}

local util = require "lspconfig.util"
require("ccls").setup(
	{
		filetypes = { "c", "cpp", "objc", "objcpp", "opencl" },
		root_dir = function(fname)
			return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
			or util.find_git_ancestor(fname)
		end,
		init_options = {
			cache =
			{
				vim.fs.normalize "~/.cache/ccls"
			}
		},
		lsp = {
			server = {
				name = "ccls", --String name
				cmd = {"/usr/bin/ccls"}, -- point to your binary, has to be a table
				args = {--[[Any args table]] },
				offset_encoding = "utf-32", -- default value set by plugin
				root_dir = vim.fs.dirname(vim.fs.find({ "compile_commands.json", ".git" }, { upward = true })[1]), -- or some other function that returns a string
				on_attach = on_attach,
				capabilites = cmp_capabilities
			},
			codelens = {
				enable = true,
				events = {"BufWritePost", "InsertLeave"}
			},
			-- Uncomment to enable coexistance with clangd
			disable_capabilities = {
				completionProvider = true,
				documentFormattingProvider = true,
				documentRangeFormattingProvider = true,
				documentHighlightProvider = true,
				documentSymbolProvider = true,
				workspaceSymbolProvider = true,
				renameProvider = true,
				hoverProvider = true,
				codeActionProvider = true,
			},
			disable_diagnostics = true,
			disable_signature = true,
		}
	})
require("lspsaga").setup {}
