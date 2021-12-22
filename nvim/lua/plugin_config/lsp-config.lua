local inspect = require("plugin_config/inspect")
-- LSP

local lsp_installer = require("nvim-lsp-installer")

function common_on_attach(client, bufnr)
	-- ... set up buffer keymaps, etc.
end
require("plugin_config/lsp_configurations/csharp")

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = common_on_attach,
	}

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end

	server:setup(opts)
	vim.cmd [[ do User LspAttachBuffers ]]
	vim.cmd [[ COQnow -s ]]
end)


