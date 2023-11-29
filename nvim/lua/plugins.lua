local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Make paq manage itself
		use "wbthomason/packer.nvim"

	local devicons = {
		"kyazdani42/nvim-web-devicons",
		config = function ()
			require"nvim-web-devicons".setup {}
		end
	}
	local plenary = "nvim-lua/plenary.nvim"

	-- Search utils
		use
		{
			{
				"nvim-telescope/telescope.nvim", tag = "0.1.4",
				requires = {
					"junegunn/fzf",
					"junegunn/fzf.vim",
					"BurntSushi/ripgrep",
					plenary,
					"sharkdp/fd",
					devicons,
					{
						"nvim-telescope/telescope-fzf-native.nvim",
						run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
					}
				}
			},
			{ "nvim-telescope/telescope-ui-select.nvim" }
		}

	-- Editor appereance
		use {
			"akinsho/bufferline.nvim",
			requires = {
				devicons,
			}
		}

		use {
			"nvim-lualine/lualine.nvim", -- TODO add status line integration with other utilities
			requires = { devicons },
		}
	-- Icons
		use {
			devicons,
			{ "onsails/lspkind-nvim" }
		}

	-- Code highlight
		use {
			{
				"nvim-treesitter/nvim-treesitter",
				run = ":TSUpdate"
			},
			{ "nvim-treesitter/nvim-treesitter-context" },
			{ "p00f/nvim-ts-rainbow" }
		}

	-- LSP
		use {
			{ "neovim/nvim-lspconfig" },
			{ "folke/neodev.nvim" },
			{ "williamboman/mason.nvim", run = ":MasonUpdate" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "jay-babu/mason-nvim-dap.nvim" },
		}
		use {
			"p00f/clangd_extensions.nvim",
		}
		use "numToStr/Comment.nvim" -- Coments
		use "rhysd/vim-grammarous" -- Gramma check

	-- Completion
		use {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"uga-rosa/cmp-dictionary",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua"
		}

	-- Snippets
		use {
			{
				"L3MON4D3/LuaSnip",
				run = "make install_jsregexp"
			},
			"saadparwaiz1/cmp_luasnip",
		}

	-- IDE features [TODO]
		use "mhartington/formatter.nvim" -- TODO: Add integration with formatters
		use "tpope/vim-fugitive" -- Git

	-- Debug adapter
		use {
			"mfussenegger/nvim-dap",
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui"
		}

		use {
			"folke/trouble.nvim", -- Errors list
			requires = { devicons, plenary },
			config = function()
				require("trouble").setup { }
			end
		}
		use "Civitasv/cmake-tools.nvim"

	-- Coloschemes
		use {
			"Shatur/neovim-ayu",
			"EdenEast/nightfox.nvim",
			"rebelot/kanagawa.nvim",
		}

		if packer_bootstrap then
			require('packer').sync()
		end
end)
