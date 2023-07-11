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

-- rust ghost-character hints
local rt = require("rust-tools")
rt.setup()
rt.inlay_hints.enable()

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

-- load coc options
require("coc-bindings")

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
npairs.setup({map_cr=false})

_G.MUtils= {}

MUtils.completion_confirm=function()
	if vim.fn["coc#pum#visible"]() ~= 0  then
		return vim.fn["coc#pum#confirm"]()
	else
		return npairs.autopairs_cr()
	end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

-- ASCII math 
require"nabla".enable_virt()

-- load legacy.vim
vim.cmd([[ so ~/.config/nvim/legacy.vim ]])
