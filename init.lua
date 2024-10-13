local vim = vim
local keymaps = require("keymaps")
local config = require("config")
local lazy_setup = require("config.lazy-setup")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local function main()
	config.setup()

	-- Setup lazy.nvim
	local lazy = require("lazy")
	lazy.setup(
		lazy_setup
	)

	require("nvim-tree").setup{
		on_attach = keymaps.attach,
	}

	keymaps.setup()



end

main()
