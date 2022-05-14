-- Set the short hand
local plug = require("paq").paq

-- Make paq manage itself
plug { "savq/paq-nvim", opt = true }

-- Libs
plug "nvim-lua/plenary.nvim"
plug "xolox/vim-misc"
plug "sharkdp/fd"
plug "roxma/nvim-yarp"
plug "roxma/vim-hug-neovim-rpc"
plug "neomake/neomake"

-- Addons
-- Galaxyline line in top with all tabs
plug "akinsho/bufferline.nvim"
plug "NTBBloodbath/galaxyline.nvim" -- Status line in the bottom
plug "kyazdani42/nvim-tree.lua" -- FileTree
plug "ms-jpq/chadtree" -- File tree buffer
plug "preservim/tagbar" -- Bar with all tags

-- Icons
plug "kyazdani42/nvim-web-devicons"
plug "ryanoasis/vim-devicons"
plug "onsails/lspkind-nvim" -- Icons for completion

-- LSP and code analysis
plug "neovim/nvim-lspconfig"
plug "williamboman/nvim-lsp-installer" -- servers installer
plug "tami5/lspsaga.nvim" -- LSP UI
plug "dense-analysis/ale" -- Additional checker
plug { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' } -- Support for Jupyter notebook
plug "ojroques/nvim-lspfuzzy" -- Fuzzy search for LSP

plug "rhysd/vim-grammarous" -- Gramma check

-- Completion
plug "ms-jpq/coq_nvim" -- COQ completer
plug "ms-jpq/coq.artifacts" -- COQ snippets plugin
plug "numToStr/Comment.nvim" -- Coments
plug "windwp/nvim-autopairs" -- Scopes completer

-- Highlight
plug "nvim-treesitter/nvim-treesitter" -- Highliting
plug "xolox/vim-easytags" -- Tag generation and syntax highlight
plug "norcalli/nvim-colorizer.lua" -- Color highlight
plug "p00f/nvim-ts-rainbow" -- Rainbow parentheses

-- Coloschemes
plug "Shatur/neovim-ayu"
plug "EdenEast/nightfox.nvim"

-- Test support
plug "alepez/vim-gtest"

-- Git support
plug "tpope/vim-fugitive"

-- Utils

if vim.version()["minor"] >= 6 then
	plug "nvim-telescope/telescope.nvim" -- Fuzy finder
end

-- Keyboard utils
plug "lyokha/vim-xkbswitch" -- Switcher of languages between insert and command mode

-- Search utils
plug "junegunn/fzf"
plug "junegunn/fzf.vim"  -- to enable preview (optional)

-- Debugging
plug {"sakhnik/nvim-gdb" , run = "./install"}


-----------------------------------------------------
-- After all plugins installed calling plugin configs
require("plugin_config/galaxyline-config")
require("plugin_config/bufferline-config")

require("plugin_config/code_analysis")
require("plugin_config/highlighting-config")
require("plugin_config/code_editor")

require("plugin_config/magma-nvim")

require("plugin_config/xkb_switch-config")

if vim.version()["minor"] >= 6 then
	require("plugin_config/telescope-config")
end
