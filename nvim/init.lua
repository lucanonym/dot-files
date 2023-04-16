-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("luca.core.options")
require("luca.core.keymaps")

-- load plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{ "bluz71/vim-nightfly-colors", name = "nightfly" },
	{ "christoomey/vim-tmux-navigator" },
	{ "szw/vim-maximizer" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	-- autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	-- snippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },
	-- managing & installing lsp servers
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	-- configuring lsp servers
	{ "neovim/nvim-lspconfig" },

	-- additional plugins for lsp
	{ "glepnir/lspsaga.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "jose-elias-alvarez/typescript.nvim" },

	-- linting and formatting
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("luca.plugins.lsp.null-ls") -- null-ls config
		end,
	},

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	--autoclosing
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
})

-- setup colorscheme after loading plugins

-- configure nvim-tree
require("luca.plugins.nvim-tree")

-- configure telescope
require("luca.plugins.telescope")

require("luca.core.colorscheme")
-- Autosuggestions
require("luca.plugins.nvim-cmp")

--setup lsp server and config for (Rust, HTML, VUE, TS, Latex)
require("luca.plugins.lsp.mason")
require("luca.plugins.lsp.lspsaga")
require("luca.plugins.lsp.lspconfig")

-- configure Linting
require("luca.plugins.lsp.null-ls")
require("luca.plugins.autopairs")
require("luca.plugins.treesitter")
