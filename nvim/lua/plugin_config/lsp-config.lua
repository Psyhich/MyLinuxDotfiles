-- Installer
local lsp_installer = require("nvim-lsp-installer")

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

function RunCOQ()
	vim.cmd(":COQnow -s")
end

-- LspConfig
lsp_installer.on_server_ready(function(server)
	local opts = {
		capabilities = capabilities,
		on_attach = RunCOQ
	}

	if server.name == "sumneko_lua" then
		local runtime_path = vim.split(package.path, ';')
		table.insert(runtime_path, 'lua/?.lua')
		table.insert(runtime_path, 'lua/?/init.lua')

		opts.settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = 'LuaJIT',
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { 'vim' },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file('', true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			}
		}

	 end

	server:setup(opts)
end)

-- Setting signs for
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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

