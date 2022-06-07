-- Installer
-- Lsp fuzzy finder
require('lspfuzzy').setup {}

require("nvim-lsp-installer").setup{}

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- LspConfig
local lua_runtime_path = vim.split(package.path, ';')
table.insert(lua_runtime_path, 'lua/?.lua')
table.insert(lua_runtime_path, 'lua/?/init.lua')
lspconfig.sumneko_lua.setup
{
	opts =
	{
		settings =
		{
		Lua =
			{
				runtime =
				{
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Setup your lua path
					path = lua_runtime_path,
				},
				diagnostics =
				{
					-- Get the language server to recognize the `vim` global
					globals = { 'vim', 'nvim' },
				},
				workspace =
				{
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file('', true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry =
				{
					enable = false,
				},
			}
		}
	}
}
lspconfig.gdscript.setup{ flags = { debounce_text_changes = 150 } }
lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.cmake.setup{}
lspconfig.hls.setup{}
lspconfig.ltex.setup{}
lspconfig.omnisharp.setup{}
lspconfig.pylsp.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.sumneko_lua.setup{}
lspconfig.yamlls.setup{}
lspconfig.html.setup{}
lspconfig.emmet_ls.setup{}
lspconfig.tailwindcss.setup{}

-- Setting signs for
local signs =
{
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Key maps
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>") -- Jump to declaration
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- Jump to definition
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- Jump to implementation
map("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>") -- Rename
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>") -- Find references
map("n", "<leader>ac", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>") -- Code action
map("n", "<leader>sh", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>") -- Function signature

