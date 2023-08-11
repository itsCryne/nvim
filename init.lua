-- load all plugins
require('plugins')

-- discord presence
require("presence").setup({
	neovim_image_text   = "nvim",
	main_image          = "file",
	log_level = nil 
})

-- theme (set light explicitly to prevent flicker)
require('onenord').setup({
	theme = "light",
	fade_nc = true
})

-- rust tools
local rt = require("rust-tools")
rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})

rt.inlay_hints.enable()

-- lsp
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

-- rainbow brackets
local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
	strategy = {
		[''] = rainbow_delimiters.strategy['global'],
		vim = rainbow_delimiters.strategy['local'],
	},
	query = {
		[''] = 'rainbow-delimiters',
		lua = 'rainbow-blocks',
	},
	highlight = {
		'RainbowDelimiterRed',
		'RainbowDelimiterBlue',
		'RainbowDelimiterYellow',
		'RainbowDelimiterGreen',
		'RainbowDelimiterOrange',
		'RainbowDelimiterViolet',
		'RainbowDelimiterCyan',
	},
}

-- "file manager" bar
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 20,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

-- status bar
require('lualine').setup({
	options = { theme = 'onelight' }
})

local npairs = require('nvim-autopairs')
npairs.setup()

-- Telescope
local tel = require("telescope")
tel.setup()
tel.load_extension("fzf")

-- crates autocomplete
require('crates').setup {
	src = {
		coq = {
			enabled = true,
			name = "crates.nvim",
		},
	},
}

-- disable repetitive keystrokes etc.
require("hardtime").setup()
-- load legacy.vim
vim.cmd([[ so ~/.config/nvim/legacy.vim ]])

-- Indentation indicators
vim.cmd [[hi IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[hi IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[hi IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[hi IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[hi IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[hi IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
}

vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "Refresh indent colors",
	callback = function()
		vim.cmd [[hi IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
		vim.cmd [[hi IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
		vim.cmd [[hi IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
		vim.cmd [[hi IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
		vim.cmd [[hi IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
		vim.cmd [[hi IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
	end,
})
