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

local plugins = {
	--Dash Board
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Auto Formatting
	{ "jose-elias-alvarez/null-ls.nvim" },
	--  Nvim Commnet
	{ "terrortylor/nvim-comment" },

	-- Colorscheme
	{ "ellisonleao/gruvbox.nvim" },

	-- Colorizer.lua
	{ "norcalli/nvim-colorizer.lua" },

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- Indent Line
	{ "lukas-reineke/indent-blankline.nvim" },

	-- GitSign Plugins
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
			})
		end,
	},

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = "bufWinEnter" },

	-- nvim-ts-autotag
	{ "windwp/nvim-ts-autotag" },

	-- Nvim treesitter rainbow
	{ "mrjones2014/nvim-ts-rainbow" },

	-- nvim autopairs
	{ "windwp/nvim-autopairs" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "kdheepak/lazygit.nvim" },
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	-- NeoVIMTree
	{ "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Buffer Line
	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	-- Lua Line
	{ "nvim-lualine/lualine.nvim" },

	-- WhichKey
	{ "folke/which-key.nvim" },

	-- Auto Completion
	{ "hrsh7th/nvim-cmp" }, -- cmp Completion plugin
	{ "hrsh7th/cmp-buffer" }, -- buffer completion
	{ "hrsh7th/cmp-path" }, -- path completion
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" }, -- command line Completion

	{ "saadparwaiz1/cmp_luasnip" },
	-- Snipit Engine
	{ "L3MON4D3/LuaSnip" }, -- lua snip

	-- Lsp Saga
	{ "glepnir/lspsaga.nvim" },

	-- lspkind for icons with snipits
	{ "onsails/lspkind.nvim" },

	-- Managing Language server Protocols through mason
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
} -- end of plugin line
require("lazy").setup(plugins, opts)
