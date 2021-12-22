-- Set the short hand
local plug = require('paq-nvim').paq

-- Make paq manage itself
plug {'savq/paq-nvim', opt=true}

-- Libs
plug 'nvim-lua/plenary.nvim'
plug 'xolox/vim-misc'

-- Addons
-- Galaxyline line in top with all tabs
plug 'akinsho/bufferline.nvim'
plug 'glepnir/galaxyline.nvim' -- Buferline line in the bottom
plug 'kyazdani42/nvim-tree.lua' -- FileTree

-- Icons
plug 'kyazdani42/nvim-web-devicons'
plug 'ryanoasis/vim-devicons'
plug 'onsails/lspkind-nvim' -- Icons for completion

plug 'Yggdroot/indentLine' -- Indent representation

-- LSP Server
plug 'neovim/nvim-lspconfig'
plug 'williamboman/nvim-lsp-installer' -- Easier configurations manager
plug 'glepnir/lspsaga.nvim' -- Better LSP UI

-- Completion
plug 'ms-jpq/coq_nvim' -- COQ completer
plug 'ms-jpq/coq.artifacts' -- COQ snippets plugin
plug 'deoplete-plugins/deoplete-clang' -- Clang code completion
--plug 'lervag/vimtex' -- Tex and Latex syntax check
plug 'scrooloose/nerdcommenter' -- Coments

-- Highlight
plug 'nvim-treesitter/nvim-treesitter' -- Highliting
plug 'xolox/vim-easytags' -- Tag generation and syntax highlight
plug 'dense-analysis/ale' -- Syntax checker

-- Coloschemes
plug 'zacanger/angr.vim'
plug 'morhetz/gruvbox'

-- Utils
plug 'rsaraf/vim-advanced-lint' -- C++ linter
plug 'nvim-telescope/telescope.nvim' -- Fuzy finder
plug 'sharkdp/fd' -- Alternative to find
plug 'lyokha/vim-xkbswitch' -- Switcher of languages between insert and command mode
plug 'rhysd/vim-grammarous' -- Gramma check

-- Tags
plug 'preservim/tagbar' -- Bar with all tags

-- Debugging
plug 'mfussenegger/nvim-dap'

-- After all plugins installed calling plugin configs

require("plugin_config/galaxyline-config")
require("plugin_config/bufferline-config")
require("plugin_config/lsp-config")
require("plugin_config/highlighting-config")
require("plugin_config/coq-config")
require("plugin_config/nerd_commenter-config")
require("plugin_config/debuger-config")
require("plugin_config/indent_line-config")
require("plugin_config/xkb_switch-config")

