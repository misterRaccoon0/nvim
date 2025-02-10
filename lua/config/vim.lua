local vim = vim

-- vim base config pre-loading of lazy plugins

-- vim configs
--
vim.o.number = true
vim.o.shiftwidth = 4
-- vim.cmd[[colorscheme gruvbox]]
vim.opt.fillchars =  {eob = " "}

vim.opt.termguicolors = true
-- vim custom base keymap

local map = vim.keymap.set

-- map opts autofill function
local function opts(desc)
    return {desc = "Nvim: "..desc, silent = true, nowait=true, noremap = false}
end

-- normal map
local function nmap(lhs,rhs,options)
    return map("n", lhs, rhs, options)
end

map({'n', 'i'},'<C-s>', function() vim.api.nvim_command('write') end, { desc = 'Save File' })

-- buffer operations
local function hasMultipleBuffer()
    return table.getn(
	vim.tbl_filter(
	    function(buf) return vim.api.nvim_buf_get_option(buf, 'buflisted') end,
	    vim.api.nvim_list_bufs()
	)
    ) > 1
end

map(
    {'n','i'},
    "<M-[>",
    function()
	if (hasMultipleBuffer()) then
	    vim.api.nvim_command[[bprev]]
	end
    end,
    {
	desc = "Goto Previous Buffer",
	nowait = true,
	noremap = true,
	silent = true
    }
)
map(
    {'n','i'},
    "<M-]>",
    function ()
	if (hasMultipleBuffer()) then
	    vim.api.nvim_command[[bnext]]
	end
    end,
    {
	desc = "Goto Next Buffer",
	nowait = true,
	noremap = true,
	silent = true
    }
)

map(
    {'n','i'},
    "<C-q>",
	function ()
	    vim.api.nvim_command[[bwipeout]]
	end,
    {
	desc = "Close Buffer",
	nowait = true,
	noremap = true,
	silent = true
    }
)

----

-- tab operations
map(
    {'n', 'i'},
    "<M-S-t>t",
	function ()
	    vim.api.nvim_command('tabnew')
	end,
    {
	desc = "New Tab",
	noremap = false
    }
)
map(
    {'n', 'i'},
    "<M-S-t>q",
	function ()
	    vim.api.nvim_command('tabclose')
	end,
    {
	desc = "Close Tab",
	noremap = false
    }
)
map(
    {'n', 'i'},
    "<M-S-t>[",
	function ()
	    vim.api.nvim_command('tabprevious')
	end,
    {
	desc = "Goto Previous Tab",
	noremap = false
    }
)
map(
    {'n', 'i'},
    "<M-S-t>]",
	function ()
	    vim.api.nvim_command('tabnext')
	end,
    {
	desc = "Goto Next Tab",
	noremap = false
    }
)
map(
    {'n', 'i'},
    "<C-\\>",
    "<Esc>:"
    ,
    {
	desc = "Open commandline",
	noremap = false
    }
)

-- window size operations
nmap("<C-w>[", "<C-w><", {desc = "Decrease Window Width", noremap = false})
nmap("<C-w>]", "<C-w>>", {desc = "Increase Window Width", noremap = false})




