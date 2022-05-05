require("plugin_config/lsp-config")
require("plugin_config/ale-config")

-- Tags support
vim.g.easytags_cmd = "ctags-universal"
vim.g.easytags_dynamic_files = 1
vim.g.easytags_async = 1
vim.g.easytags_opts =
{
	"--languages=all",
	"--append=no"
}
