-- Installer
local lsp_installer = require("nvim-lsp-installer")

-- LspConfig
lsp_installer.on_server_ready(function(server)

	server:setup({})
	--vim.cmd [[ do User LspAttachBuffers ]]

	-- Starting COQ
	server:setup(coq.lsp_ensure_capabilities())
	vim.cmd [[ COQnow -s ]]
end)
