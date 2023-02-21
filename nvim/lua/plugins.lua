vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Make paq manage itself
		use 'wbthomason/packer.nvim'

	-- Libs
		use "xolox/vim-misc"
		use "sharkdp/fd"
		use "roxma/nvim-yarp"
		use "roxma/vim-hug-neovim-rpc"
		use "neomake/neomake"
		use "BurntSushi/ripgrep"

	-- Search utils
		use "junegunn/fzf"
		use "junegunn/fzf.vim"  -- to enable preview (optional)

	-- Editor appereance
		use "akinsho/bufferline.nvim"
		use "NTBBloodbath/galaxyline.nvim" -- Status line in the bottom
		use "ms-jpq/chadtree" -- File tree buffer
		use "preservim/tagbar" -- Bar with all tags
		-- Icons
			use{
				"kyazdani42/nvim-web-devicons",
				config = function ()
					require'nvim-web-devicons'.setup {}
				end
			}
			use "ryanoasis/vim-devicons"
			use "onsails/lspkind-nvim" -- Icons for completion

	-- LSP and code analysis
		use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	-- lspconfig
		use 'neovim/nvim-lspconfig'
		use "tami5/lspsaga.nvim" -- prettier LSP windows

	-- Completion
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'uga-rosa/cmp-dictionary'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-nvim-lua'

	-- Snippets [TODO]
		use 'saadparwaiz1/cmp_luasnip'
		use 'L3MON4D3/LuaSnip'
		use 'rafamadriz/friendly-snippets'

	-- LSP managers
		use 'williamboman/mason.nvim'
		use 'williamboman/mason-lspconfig.nvim'

	-- External LSPs
		use 'ranjithshegde/ccls.nvim'

		use "rhysd/vim-grammarous" -- Gramma check

		use "numToStr/Comment.nvim" -- Coments

	-- Highlight
		use "spywhere/detect-language.nvim" -- Language autodetect
		use "norcalli/nvim-colorizer.lua" -- Color highlight
		use "p00f/nvim-ts-rainbow" -- Rainbow parentheses

	-- IDE features [TODO]
		use { 'mhartington/formatter.nvim' } -- Formatter
		use {
			"folke/trouble.nvim", -- Errors list
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("trouble").setup { }
			end
		}
		use "ilyachur/cmake4vim"
		use "SantinoKeupp/telescope-cmake4vim.nvim"
		-- use "vim-test/vim-test"

	-- Coloschemes
		use "Shatur/neovim-ayu"
		use "EdenEast/nightfox.nvim"
		use "folke/tokyonight.nvim"
		use "rebelot/kanagawa.nvim"

	-- Git support
		use "tpope/vim-fugitive"
		use
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.0',
			requires = { {'nvim-lua/plenary.nvim'} }
		}
end)
