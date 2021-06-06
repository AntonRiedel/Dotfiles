--[[--
File              : packer.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 05.06.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
-- install packer if it is not installed already
local install_path = vim.fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
        'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.api.nvim_command 'packloadall'
end

return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}

    -- quality of life
    -- use {'gruvbox-community/gruvbox'}
    use 'shaunsingh/moonlight.nvim'
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-repeat'}
    use {'vimwiki/vimwiki'}
    use {'jiangmiao/auto-pairs'}
    use {'itchyny/lightline.vim'}
    -- use {'junegunn/fzf'}

    -- development
    use {'alpertuna/vim-header'}
    use {'mhinz/vim-signify'}
    use {'tpope/vim-fugitive'}
    use {'sbdchd/neoformat'}
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/completion-nvim'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use {'SirVer/ultisnips', requires = {'honza/vim-snippets'}}
end)
