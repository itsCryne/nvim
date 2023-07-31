return require('packer').startup(function(use)
	-- Packer itself
	use("wbthomason/packer.nvim")
	-- Theme
	use 'rmehri01/onenord.nvim'
	-- Syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	-- NVim LSP config
	use("neovim/nvim-lspconfig")
	-- Inline hints etc.
	use 'simrat39/rust-tools.nvim'
	-- Rust Syntax/Formatting
	use 'rust-lang/rust.vim'
	-- Rainbow brackets
	use 'hiphish/rainbow-delimiters.nvim'
	-- File "manager"
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	-- automatic formatting
	use 'sbdchd/neoformat'
	-- highlight and fix trailing whitespace
	use 'ntpeters/vim-better-whitespace'
	-- auto create/delete paired brackets/quotes/…
	use 'windwp/nvim-autopairs'
	-- linting
	use 'dense-analysis/ale'
	-- markdown preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
	-- LaTeX suite
	use 'lervag/vimtex'
	-- ASCII math
	use 'jbyuki/nabla.nvim'
	-- Discord presence
	use 'andweeb/presence.nvim'
	-- Jupyter-Notebooks
	use{
               'luk400/vim-jukit',
               ft = {'ipynb', 'py'}
	}

	-- Indentation indicator
	use "lukas-reineke/indent-blankline.nvim"
	-- Debugging
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'
	-- Autocomplete
	use { 'ms-jpq/coq_nvim', run = 'python3 -m coq deps' }
	use 'ms-jpq/coq.artifacts'
	use 'ms-jpq/coq.thirdparty'
	-- Telescope (searching etc.)
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	-- crates autocomplete
	use {
		'saecki/crates.nvim',
		tag = 'v0.3.0',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	-- display possible key combos
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}
	-- smooth scrolling
	use {
		'declancm/cinnamon.nvim',
		config = function() require('cinnamon').setup() end
	}
	-- disable repetitive keystrokes etc.
	use "m4xshen/hardtime.nvim"
	-- tabline
	use 'romgrk/barbar.nvim'
	-- surround manipulation
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end
	})
	-- clipboard manager
	use {
		"AckslD/nvim-neoclip.lua",
		requires = {
			{'nvim-telescope/telescope.nvim'},
		},
		config = function()
			require('neoclip').setup()
		end,
	}
end)
