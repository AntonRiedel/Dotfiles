--[[--
File              : packer.lua
Author            : Anton Riedel <anton.riedel@tum.de>
Date              : 25.04.2021
Last Modified Date: 30.04.2021
Last Modified By  : Anton Riedel <anton.riedel@tum.de>
--]] --
return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim'}

    -- quality of life
    use {'gruvbox-community/gruvbox'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-repeat'}
    use {'vimwiki/vimwiki'}
    use {'jiangmiao/auto-pairs'}
    use {'itchyny/lightline.vim'}
    use {'junegunn/fzf'}

    -- development
    use {'alpertuna/vim-header'}
    use {'mhinz/vim-signify'}
    use {'tpope/vim-fugitive'}
    use {'sbdchd/neoformat'}
    use {'neovim/nvim-lspconfig'}
    use {'nvim-lua/completion-nvim'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {'SirVer/ultisnips'}
    use {'honza/vim-snippets'}
end)
