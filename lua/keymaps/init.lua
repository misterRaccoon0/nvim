local M = {}
local k = vim.keycode
function M.setup()
	-- Make sure to setup `mapleader` and `maplocalleader` before
	-- loading lazy.nvim so that mappings are correct.
	-- This is also a good place to setup other settings (vim.opt)
	vim.keymap.set("n", "<leader>e",function() vim.cmd[[:NvimTreeToggle]] end)

end

function M.attach()
	local api = require "nvim-tree.api"

  	local function opts(desc)
    		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  	end

  	-- default mappings
  	api.config.mappings.default_on_attach(bufnr)

  	-- custom mappings
  		vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  	vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

return M
