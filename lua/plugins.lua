local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("kyazdani42/nvim-web-devicons")

	-- Theme
	use("Mofiqul/dracula.nvim")

	-- Status Bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("configs.lualine")
		end,
	})

	------------------------------------------------
	-- Start Screen
	------------------------------------------------
	use({
		"mhinz/vim-startify",
		config = function()
			require("configs.vim-startify")
		end,
	})

	------------------------------------------------
	-- Explorer
	------------------------------------------------
	use({
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("configs.nvim-tree")
		end,
	})

	------------------------------------------------
	-- Fuzzy Finder
	------------------------------------------------
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	})
	use({
		"nvim-telescope/telescope-project.nvim",
		config = function()
			require("telescope").load_extension("project")
		end,
	})
	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
		end,
	})

	------------------------------------------------
	-- Nice to have plugins
	------------------------------------------------
	use("ggandor/lightspeed.nvim")
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})
	use("andymass/vim-matchup")
	use("markstory/vim-zoomwin")
	use("jeffkreeftmeijer/vim-numbertoggle")
	use("junegunn/vim-easy-align")
	use("tpope/vim-surround")
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "|",
				buftype_exclude = { "terminal" },
			})
		end,
	})
	use({
		"crivotz/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	------------------------------------------------
	-- Search And Replace
	------------------------------------------------
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	-- optional
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	use("mhinz/vim-grepper")

	------------------------------------------------
	-- Terminal
	------------------------------------------------
	use("voldikss/vim-floaterm")

	------------------------------------------------
	-- Git and Undo History
	------------------------------------------------
	use("tpope/vim-fugitive")
	use("airblade/vim-gitgutter")
	use("mbbill/undotree")

	------------------------------------------------
	-- Editor Config
	------------------------------------------------
	use("editorconfig/editorconfig-vim")

	------------------------------------------------
	-- Syntax Highlighting
	------------------------------------------------
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("configs.treesitter")
		end,
	})
	use("p00f/nvim-ts-rainbow")
	use("haringsrob/nvim_context_vt")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	------------------------------------------------
	-- LSP
	------------------------------------------------
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"neovim/nvim-lspconfig",
		opt = false,
		config = function()
			require("configs.lspconfig")
		end,
	})
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("configs.lspsaga")
		end,
	})
	-- null-ls: support for non-lsp
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	-- nice ui to view errors and warnings
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	------------------------------------------------
	-- Auto Complete
	------------------------------------------------
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		}
	})
	use({
		"onsails/lspkind-nvim",
		config = function()
			require("configs.lspkind-nvim")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
