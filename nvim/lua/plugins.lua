-- Set the short hand
local plug = require("paq").paq

-- Make paq manage itself
plug {"savq/paq-nvim", opt=true}

-- Libs
plug "nvim-lua/plenary.nvim"
plug "xolox/vim-misc"
plug "sharkdp/fd"

-- Addons
-- Galaxyline line in top with all tabs
plug "akinsho/bufferline.nvim"
plug "glepnir/galaxyline.nvim" -- Status line in the bottom
plug "kyazdani42/nvim-tree.lua" -- FileTree

-- Icons
plug "kyazdani42/nvim-web-devicons"
plug "ryanoasis/vim-devicons"
plug "onsails/lspkind-nvim" -- Icons for completion

-- LSP and code analysis
plug "neovim/nvim-lspconfig"
plug "williamboman/nvim-lsp-installer" -- servers installer
plug "glepnir/lspsaga.nvim" -- LSP UI
plug "dense-analysis/ale" -- Additional checker

-- Completion
plug "ms-jpq/coq_nvim" -- COQ completer
plug "ms-jpq/coq.artifacts" -- COQ snippets plugin
plug "scrooloose/nerdcommenter" -- Coments

-- Highlight
plug "nvim-treesitter/nvim-treesitter" -- Highliting
plug "xolox/vim-easytags" -- Tag generation and syntax highlight

-- Coloschemes
plug "morhetz/gruvbox"
plug "ayu-theme/ayu-vim"
plug "EdenEast/nightfox.nvim"

-- Utils
plug "rsaraf/vim-advanced-lint" -- C++ linter
plug "nvim-telescope/telescope.nvim" -- Fuzy finder
plug "lyokha/vim-xkbswitch" -- Switcher of languages between insert and command mode
plug "rhysd/vim-grammarous" -- Gramma check

-- Tags
plug "preservim/tagbar" -- Bar with all tags

-- Debugging
plug "mfussenegger/nvim-dap"

-- After all plugins installed calling plugin configs
require("plugin_config/galaxyline-config")
require("plugin_config/bufferline-config")

require("plugin_config/lsp-config")
require("plugin_config/highlighting-config")
require("plugin_config/ale-config")

require("plugin_config/coq-config")
require("plugin_config/nerd_commenter-config")

require("plugin_config/debuger-config")
require("plugin_config/xkb_switch-config")

require("plugin_config/telescope-config")
