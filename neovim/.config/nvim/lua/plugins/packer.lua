--[[--
File              : packer.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 02.08.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- install packer if it is not installed already
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command(
        '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.api.nvim_command('packadd packer.nvim')
    vim.api.nvim_command('PackerSync')
end

return require('packer').startup(function()

    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

    -- quality of life
    use 'marko-cerovac/material.nvim' -- for palenight colorscheme
    use {'hoob3rt/lualine.nvim'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-repeat'}
    -- use {'jiangmiao/auto-pairs'}
    use {'windwp/nvim-autopairs'}
    -- use {'cohama/lexima.vim'}
    use {'unblevable/quick-scope'}
    use {'vhyrro/neorg', requires = {'nvim-lua/plenary.nvim'}}
    use {'vimwiki/vimwiki'}
    -- use {'itchyny/lightline.vim'}
    -- use {'gruvbox-community/gruvbox'}

    -- development
    use {'alpertuna/vim-header'}
    use {'mhinz/vim-signify'}
    use {'tpope/vim-fugitive'}
    use {'sbdchd/neoformat'}
    use {'neovim/nvim-lspconfig'}
    use 'hrsh7th/nvim-compe'
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
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'SirVer/ultisnips', requires = {'honza/vim-snippets'}}
    -- use {'junegunn/fzf'}
    -- use {'nvim-lua/completion-nvim'}
end)
