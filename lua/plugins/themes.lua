return {
    lazy = false,
    priority = 1000,

    'morhetz/gruvbox',
    'EdenEast/nightfox.nvim',
    {'catppuccin/nvim', name='catppuccin'},
    'rebelot/kanagawa.nvim',
    { "bluz71/vim-nightfly-colors", name = "nightfly"},
    {
	'folke/tokyonight.nvim',
	config = function()
	    require('tokyonight').setup{
		style = 'moon'
	    }

	end
    }
}
