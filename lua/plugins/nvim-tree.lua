return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },

    config = function()
	-- pass to setup along with your other options


	require("nvim-tree").setup ({
	    view = {
		width = 26
	    },
	    on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		local function opts(desc)
		    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		api.config.mappings.default_on_attach(bufnr)
		-- custom map
		vim.keymap.set("n", "e", api.node.open.edit, opts("Edit File"))
	    end
	})
    end

}
