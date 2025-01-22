return {
    'echasnovski/mini.nvim',
    version = '*',
    lazy = false,
    priority = 1100,
    dependencies = {
	"echasnovski/mini.starter",
	'echasnovski/mini.statusline',
	'echasnovski/mini.tabline',
	version = "*"
    },
    config = function ()
	local path_package = vim.fn.stdpath('data') .. '/site/'
	local MiniDeps = require('mini.deps')
	MiniDeps.setup({
	    path = {
		package = path_package
	    }
	})
    end,
}
