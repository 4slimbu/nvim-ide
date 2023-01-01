---@diagnostic disable: lowercase-global

-- automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

    -- Icons
    use "kyazdani42/nvim-web-devicons"

    -- Theme
    use "Mofiqul/dracula.nvim"

    -- Status Bar
    use {
      "nvim-lualine/lualine.nvim",
      config = function()
        require("configs.lualine")
      end
    }

    -- Start Screen
    use {
      "mhinz/vim-startify",
      config = function()
        require("configs.vim-startify")
      end
    }

    -- Explorer
    use {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("configs.nvim-tree")
      end
    }

    -- Fuzzy Finder 
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}},
      config = function()
        require("configs.telescope")
      end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
