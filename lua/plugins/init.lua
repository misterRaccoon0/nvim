local vim = vim
local lazypath = vim.fn.stdpath("data") .. "/lazy"
local plugins = {
	{
    		"folke/tokyonight.nvim",
    		lazy = false, -- make sure we load this during startup if it is your main colorscheme
    		priority = 1000, -- make sure to load this before all the other start plugins
    		config = function()
      		-- load the colorscheme here
      		vim.cmd([[colorscheme tokyonight]])
    		end,
	},
	{
	    'neovim/nvim-lspconfig',
	    dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		{'VonHeikemen/lsp-zero.nvim', branch = '4.x'}
	    },
	    config = function()
		local lspconfig = require("lspconfig")
		local cmp = require('cmp')
		local cmp_buffer = require('cmp_buffer')
		local lsp_zero = require('lsp-zero')
		cmp.setup({
		    sources = {
			{name = 'buffer'},
			{name = 'nvim_lsp'}
		    },
		    mapping = cmp.mapping.preset.insert({
			['<Tab>'] = cmp.mapping.confirm({select=true})
		    }),
		    formatting = lsp_zero.cmp_format({details=true})
		})

		require("mason").setup({
		    install_root_dir = vim.fn.stdpath("data") .. "/mason" ,
		    ---@since 1.0.0
		    -- Where Mason should put its bin location in your PATH. Can be one of:
		    -- - "prepend" (default, Mason's bin location is put first in PATH)
		    -- - "append" (Mason's bin location is put at the end of PATH)
		    -- - "skip" (doesn't modify PATH)
		    ---@type '"prepend"' | '"append"' | '"skip"'
		    PATH = "prepend",

		    ---@since 1.0.0
		    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
		    -- debugging issues with package installations.
		    log_level = vim.log.levels.INFO,

		    ---@since 1.0.0
		    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
		    -- packages that are requested to be installed will be put in a queue.
		    max_concurrent_installers = 4,

		    ---@since 1.0.0
		    -- [Advanced setting]
		    -- The registries to source packages from. Accepts multiple entries. Should a package with the same name exist in
		    -- multiple registries, the registry listed first will be used.
		    registries = {
			"github:mason-org/mason-registry",
		    },

		    ---@since 1.0.0
		    -- The provider implementations to use for resolving supplementary package metadata (e.g., all available versions).
		    -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
		    -- Builtin providers are:
		    --   - mason.providers.registry-api  - uses the https://api.mason-registry.dev API
		    --   - mason.providers.client        - uses only client-side tooling to resolve metadata
		    providers = {
			"mason.providers.registry-api",
			"mason.providers.client",
		    },

		    github = {
			---@since 1.0.0
			-- The template URL to use when downloading assets from GitHub.
			-- The placeholders are the following (in order):
			-- 1. The repository (e.g. "rust-lang/rust-analyzer")
			-- 2. The release version (e.g. "v0.3.0")
			-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
			download_url_template = "https://github.com/%s/releases/download/%s/%s",
		    },

		    pip = {
			---@since 1.0.0
			-- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
			upgrade_pip = false,

			---@since 1.0.0
			-- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
			-- and is not recommended.
			--
			-- Example: { "--proxy", "https://proxyserver" }
			install_args = {},
		    },

		    ui = {
			---@since 1.0.0
			-- Whether to automatically check for new versions when opening the :Mason window.
			check_outdated_packages_on_open = true,

			---@since 1.0.0
			-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
			border = "none",

			---@since 1.0.0
			-- Width of the window. Accepts:
			-- - Integer greater than 1 for fixed width.
			-- - Float in the range of 0-1 for a percentage of screen width.
			width = 0.8,

			---@since 1.0.0
			-- Height of the window. Accepts:
			-- - Integer greater than 1 for fixed height.
			-- - Float in the range of 0-1 for a percentage of screen height.
			height = 0.9,

			icons = {
			    ---@since 1.0.0
			    -- The list icon to use for installed packages.
			    package_installed = "◍",
			    ---@since 1.0.0
			    -- The list icon to use for packages that are installing, or queued for installation.
			    package_pending = "◍",
			    ---@since 1.0.0
			    -- The list icon to use for packages that are not installed.
			    package_uninstalled = "◍",
			},

			keymaps = {
			    ---@since 1.0.0
			    -- Keymap to expand a package
			    toggle_package_expand = "<CR>",
			    ---@since 1.0.0
			    -- Keymap to install the package under the current cursor position
			    install_package = "i",
			    ---@since 1.0.0
			    -- Keymap to reinstall/update the package under the current cursor position
			    update_package = "u",
			    ---@since 1.0.0
			    -- Keymap to check for new version for the package under the current cursor position
			    check_package_version = "c",
			    ---@since 1.0.0
			    -- Keymap to update all installed packages
			    update_all_packages = "U",
			    ---@since 1.0.0
			    -- Keymap to check which installed packages are outdated
			    check_outdated_packages = "C",
			    ---@since 1.0.0
			    -- Keymap to uninstall a package
			    uninstall_package = "X",
			    ---@since 1.0.0
			    -- Keymap to cancel a package installation
			    cancel_installation = "<C-c>",
			    ---@since 1.0.0
			    -- Keymap to apply language filter
			    apply_language_filter = "<C-f>",
			    ---@since 1.1.0
			    -- Keymap to toggle viewing package installation log
			    toggle_package_install_log = "<CR>",
			    ---@since 1.8.0
			    -- Keymap to toggle the help view
			    toggle_help = "g?",
	    },
    },

		})
		local mason_lspconfig = require('mason-lspconfig')	
		mason_lspconfig.setup({
		    ensure_installed = {'lua_ls', 'rust_analyzer'}
		})
		mason_lspconfig.setup_handlers({
		    function(server)
			lspconfig[server].setup({})
		    end,

		    ["lua_ls"] = function ()
			lspconfig.lua_ls.setup {
			    settings = {
				Lua = {
				    diagnostics = {
					globals = { "vim" }
				    }
				}
			    }
		       }
		    end,
		})
	    end
	},
	{
		"nvim-treesitter/nvim-treesitter",
    		build = function()
        		require("nvim-treesitter.install").update({ with_sync = true })()
    		end,
		config = function () 
      			local configs = require("nvim-treesitter.configs")

      			configs.setup({
          			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          			sync_install = false,
          			highlight = { enable = true },
          			indent = { enable = true },  
        		})
    		end,
	},
	
	{
  		"nvim-tree/nvim-tree.lua",
  		version = "*",
  		lazy = false,
  		dependencies = {
    			"nvim-tree/nvim-web-devicons",
  		},
  		config = function()
    			require("nvim-tree").setup {}
  		end,
	},

}
return plugins
