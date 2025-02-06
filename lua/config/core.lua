local vim = vim

-- vim config after loading lazy plugins

-- vim.cmd.colorscheme('tokyonight')
vim.cmd.colorscheme('catppuccin')

-- vim highlight
local api_highlight = vim.api.nvim_set_hl
local function api_hl(lhs, rhs)
    return api_highlight(0, lhs, rhs)
end
local hl = vim.cmd.highlight

vim.cmd.highlight[[Normal guibg=NONE]]
vim.cmd.highlight[[NormalNC guibg=NONE]]
vim.cmd.highlight[[NvimTreeNormal guibg=NONE]]
vim.cmd.highlight[[NvimTreeWinSeparator guibg=NONE]]
