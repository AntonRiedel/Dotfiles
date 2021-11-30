--[[--
File              : init.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 30.11.2021
Last Modified Date: 30.11.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- install packer if it is not installed already
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1',
        'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd([[packadd packer.nvim]])
end

return require('packer').startup(function(use)

    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use {'shaunsingh/moonlight.nvim', config = require('plugin/colorscheme')}

    -- statusline
    use {'nvim-lualine/lualine.nvim', config = require('plugin/statusline')}

    -- file headers
    use {'alpertuna/vim-header', config = require('plugin/fileheader')}

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require('plugin/treesitter'),
        run = ':TSUpdate'
    }

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        config = require('plugin/telescope'),
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- code formatting
    use {'lukas-reineke/format.nvim', config = require('plugin/format')}

    -- code commenting
    use {'numToStr/Comment.nvim', config = require('plugin/comment')}

    -- lsp
    use {'neovim/nvim-lspconfig', config = require('plugin/lsp')}

    -- completion
    use {
        'hrsh7th/nvim-cmp',
        config = require('plugin/completion'),
        requires = {
            {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'}, {'saadparwaiz1/cmp_luasnip'}
        }
    }

    -- snippet engine
    use {
        'L3MON4D3/LuaSnip',
        config = require('plugin/snippets'),
        requires = {'rafamadriz/friendly-snippets'}
    }

    -- auto pairs
    use {'windwp/nvim-autopairs', config = require('plugin/autopairs')}

    -- surround
    use {'tpope/vim-surround'}

    -- git integration
    use {'tpope/vim-fugitive'}
    use {
        'lewis6991/gitsigns.nvim',
        config = require('plugin/gitsigns'),
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- org mode
    use {'nvim-orgmode/orgmode', config = require('plugin/orgmode')}

    -- terminal integration
    use {'numToStr/FTerm.nvim', config = require('plugin/terminal')}

    -- make quickfix even more awesome
    use {'kevinhwang91/nvim-bqf'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)
