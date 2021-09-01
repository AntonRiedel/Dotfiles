--[[--
File              : packer.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 01.09.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- install packer if it is not installed already
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command(
        '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function()

    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- quality of life
    use 'marko-cerovac/material.nvim'
    use {'hoob3rt/lualine.nvim'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-eunuch'}
    use {'akinsho/toggleterm.nvim'}
    use {'unblevable/quick-scope'}
    use {'vhyrro/neorg', requires = {'nvim-lua/plenary.nvim'}}
    use {'vimwiki/vimwiki'}

    -- development
    use {'alpertuna/vim-header', opt = true, cmd = {'AddHeader'}}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}} -- use {'mhinz/vim-signify'}
    use {'tpope/vim-fugitive'}
    use {'sbdchd/neoformat', opt = true, cmd = {'Neoformat'}}
    use {'neovim/nvim-lspconfig'}
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'}, {'saadparwaiz1/cmp_luasnip'},
            {'kdheepak/cmp-latex-symbols'}
        }
    }
    use {'L3MON4D3/LuaSnip'}
    use {
        'nvim-treesitter/nvim-treesitter',
        branch = '0.5-compat',
        run = ':TSUpdate'
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = '0.5-compat',
        requires = {'nvim-treesitter/nvim-treesitter'}
    }
    use {'windwp/nvim-autopairs'}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
        }
    }

    use {'kevinhwang91/nvim-bqf'}

    -- use {'SirVer/ultisnips', requires = {'honza/vim-snippets'}}
    -- use {'junegunn/fzf'}
end)
