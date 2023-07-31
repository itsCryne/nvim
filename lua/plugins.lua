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
end)
