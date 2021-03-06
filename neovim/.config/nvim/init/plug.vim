" File              : plug.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 23.11.2020
" Last Modified Date: 13.02.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"plugin manager setup

"automatically install vim-plug and all other plugins if they are missing
if ! filereadable(expand('~/.local/share/nvim/site/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.local/share/nvim/site/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.local/share/nvim/site/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

let g:plug_threads=4
let g:plug_timeout=180

call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
"add support for more plugins
"silent! call repeat#set("\<Plug>MyWonderfulMap",v:count)
Plug 'mhinz/vim-signify'
Plug 'alpertuna/vim-header'
Plug 'jiangmiao/auto-pairs'
" Plug 'wincent/loupe'
" Plug 'wincent/ferret'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
"
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'sbdchd/neoformat'

call plug#end()
