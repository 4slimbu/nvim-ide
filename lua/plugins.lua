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
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })

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
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("configs.nvim-tree").setup()
    end,
  })

  ------------------------------------------------
  -- Fuzzy Finder
  ------------------------------------------------
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim",    run = "make" },
      { "AckslD/nvim-neoclip.lua" }
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("project")
      require("neoclip").setup()
    end
  }

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
      require("ibl").setup()
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
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
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
  -- Comment
  ------------------------------------------------
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("tpope/vim-commentary")

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
    },
  })
  use({
    "rafamadriz/friendly-snippets",
    requires = {
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  })
  use({
    "onsails/lspkind-nvim",
    config = function()
      require("configs.lspkind-nvim")
    end,
  })

  ------------------------------------------------
  -- Run test
  ------------------------------------------------
  use({
    "vim-test/vim-test",
    config = function()
      require("configs.vim-test")
    end,
  })

  --------------------------------------------
  -- Debugger: nvim-dap
  --------------------------------------------
  use("jbyuki/one-small-step-for-vimkind")
  use({
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jayp0521/mason-nvim-dap.nvim",
    },
    config = function()
      require("configs.nvim-dap")
    end,
  })
  -- use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })

  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("configs.lsp-signature")
    end
  })
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  })
  use({
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.rest")
    end,
  })
  -- requires ASCII-image-convertor
  use({
    "samodostal/image.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })
  use({
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup()
    end,
  })
  use({
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
        load_breakpoints_event = { "BufReadPost" },
        perf_record = false,
      })
    end,
  })
  -- require("neotest").setup({
  --   adapters = {
  --     require("neotest-python")({
  --       dap = { justMyCode = false },
  --     }),
  --     require("neotest-plenary"),
  --     require("neotest-vim-test")({
  --       ignore_file_types = { "python", "vim", "lua" },
  --     }),
  --   },
  -- })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({
    "lewis6991/gitsigns.nvim",
  })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({
    "klen/nvim-config-local",
    config = function()
      require("config-local").setup({
        -- Default configuration (optional)
        config_files = { ".vimrc.lua", ".vimrc" },            -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true,                           -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,                               -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = false,                                       -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false,                               -- Lookup config files in parent directories
      })
    end,
  })

  -- use {
  --   "kndndrj/nvim-dbee",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --   },
  --   run = function()
  --     -- Install tries to automatically detect the install method.
  --     -- if it fails, try calling it with one of these parameters:
  --     --    "curl", "wget", "bitsadmin", "go"
  --     require("dbee").install()
  --   end,
  --   config = function()
  --     require("dbee").setup( --[[optional config]])
  --   end
  -- }

  -- Packer
  -- use({
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup({
  --       -- optional configuration
  --     })
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- })

  use({ "lambdalisue/suda.vim" })

  -- Packer
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
