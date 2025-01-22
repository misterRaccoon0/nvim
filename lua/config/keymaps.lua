local vim = vim
local map = vim.keymap.set

-- map opts autofill function
local function opts(desc)
    return {desc = "Nvim: "..desc, silent = true, nowait=true, noremap = false}
end

-- normal map
local function nmap(lhs,rhs,options)
    return map("n", lhs, rhs, options)
end

-- nvim-tree keymapping
local nvimtree_api = require("nvim-tree.api")

nmap("<Leader>e", nvimtree_api.tree.toggle, opts("Toggle NvimTree"))


-- telescope keymapping
local builtin = require('telescope.builtin')

nmap('<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
nmap('<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
nmap('<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
nmap('<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


