local vim = vim

-- vim config after loading lazy plugins

vim.cmd.colorscheme('tokyonight')

-- vim highlight
local api_highlight = vim.api.nvim_set_hl
local function api_hl(lhs, rhs)
    return api_highlight(0, lhs, rhs)
end
local hl = vim.cmd.highlight

