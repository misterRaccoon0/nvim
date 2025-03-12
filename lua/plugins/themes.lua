return {
    lazy = false,
    priority = 1000,

    'morhetz/gruvbox',
    'EdenEast/nightfox.nvim',
    {
	'catppuccin/nvim',
	name = 'catppuccin',
	config = function ()
	    require'catppuccin'.setup{
		integrations = {
		    cmp = true,
		    mini = {
			enabled = true
		    },
		    notify = true,
		    noice = true,

		},
	    }
	end
    },
    'rebelot/kanagawa.nvim',
    { "bluz71/vim-nightfly-colors", name = "nightfly"},
    {
	'folke/tokyonight.nvim',
	config = function()
	    require('tokyonight').setup{
		style = 'day'
	    }

	end
    },
    {
	'projekt0n/github-nvim-theme', name = 'github-theme'
    }
}
