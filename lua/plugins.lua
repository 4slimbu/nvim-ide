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
vim.opt.rtp:prepend(lazypath);

require("lazy").setup({
  "nvim-lua/plenary.nvim",

  -- Icons
  "kyazdani42/nvim-web-devicons",

  -- Theme
  "Mofiqul/dracula.nvim",
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim",             name = "catppuccin" },
  { "projekt0n/github-nvim-theme", tag = "v0.0.7" },

  -- Status Bar
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
  },

  ------------------------------------------------
  -- Start Screen
  ------------------------------------------------
  {
    "mhinz/vim-startify",
    config = function()
      require("configs.vim-startify")
    end,
  },

  ------------------------------------------------
  -- Explorer
  ------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("configs.nvim-tree").setup()
    end,
  },

  ------------------------------------------------
  -- Fuzzy Finder
  ------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      },
      { "AckslD/nvim-neoclip.lua" }
    },
    config = function()
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("project")
      require("neoclip").setup()
    end
  },

  ------------------------------------------------
  -- Nice to have plugins
  ------------------------------------------------
  "ggandor/lightspeed.nvim",
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
  "andymass/vim-matchup",
  "markstory/vim-zoomwin",
  "jeffkreeftmeijer/vim-numbertoggle",
  "junegunn/vim-easy-align",
  "tpope/vim-surround",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "crivotz/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  ------------------------------------------------
  -- Search And Replace
  ------------------------------------------------
  { "kevinhwang91/nvim-bqf",     ft = "qf" },
  -- optional
  {
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  },
  "mhinz/vim-grepper",

  ------------------------------------------------
  -- Terminal
  ------------------------------------------------
  "voldikss/vim-floaterm",

  ------------------------------------------------
  -- Git and Undo History
  ------------------------------------------------
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  "mbbill/undotree",

  ------------------------------------------------
  -- Editor Config
  ------------------------------------------------
  "editorconfig/editorconfig-vim",

  ------------------------------------------------
  -- Syntax Highlighting
  ------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("configs.treesitter")
    end,
  },
  "p00f/nvim-ts-rainbow",
  "haringsrob/nvim_context_vt",
  "nvim-treesitter/nvim-treesitter-textobjects",

  ------------------------------------------------
  -- Comment
  ------------------------------------------------
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("configs.nvim-ts-context-commentstring")
    end,
  },
  "tpope/vim-commentary",

  ------------------------------------------------
  -- LSP
  ------------------------------------------------
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    opt = false,
    config = function()
      require("configs.lspconfig")
    end,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("configs.lspsaga")
    end,
  },
  -- null-ls: support for non-lsp
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("configs.null-ls")
  --   end,
  --   dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  -- nice ui to view errors and warnings
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  },

  ------------------------------------------------
  -- Auto Complete
  ------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  {
    "rafamadriz/friendly-snippets",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("luasnip/loaders/from_vscode").lazy_load()
    end,
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      require("configs.lspkind-nvim")
    end,
  },

  ------------------------------------------------
  -- Run test
  ------------------------------------------------
  {
    "vim-test/vim-test",
    config = function()
      require("configs.vim-test")
    end,
  },

  --------------------------------------------
  -- Debugger: nvim-dap
  --------------------------------------------
  "jbyuki/one-small-step-for-vimkind",
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "jayp0521/mason-nvim-dap.nvim",
    },
    config = function()
      require("configs.nvim-dap")
    end,
  },
  { "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("configs.lsp-signature")
    end
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      require("configs.outline")
    end,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.rest")
    end,
  },
  -- dependencies ASCII-image-convertor
  {
    "samodostal/image.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup()
    end,
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        save_dir = vim.fn.stdpath("data") .. "/nvim_checkpoints",
        load_breakpoints_event = { "BufReadPost" },
        perf_record = false,
      })
    end,
  },
  { "nvim-neotest/nvim-nio" },
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
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  {
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
  },

  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    run = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup( --[[optional config]])
    end
  },

  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion"
    }
  },

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   config = function()
  --     require("chatgpt").setup({
  --       -- optional configuration
  --     })
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- })

  { "lambdalisue/suda.vim" },
  { 'mg979/vim-visual-multi', branch = 'master' },

  {
    "robitx/gp.nvim",
    config = function()
      require("configs.gp")
    end,
  },

  {
    "coffebar/transfer.nvim",
    lazy = true,
    cmd = { "TransferInit", "DiffRemote", "TransferUpload", "TransferDownload", "TransferDirDiff", "TransferRepeat" },
    opts = {},
  },
})
