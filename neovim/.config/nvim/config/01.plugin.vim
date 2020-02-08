"------------------------------------------------------------------------------
"     File Name           :     01.plugin.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-02-23 19:31]
"     Last Modified       :     [2020-02-05 11:08]
"     Description         :     Configuration for plugins (using vim-plug)
"------------------------------------------------------------------------------

let g:plug_threads = 2
let g:plug_timeout = 120

call plug#begin('$HOME/.vim/plugged')

Plug 'iCyMind/NeoSolarized'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf.vim'

Plug 'lambdalisue/suda.vim'

Plug 'godlygeek/tabular'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'shanzi/autoHEADER'
Plug 'scrooloose/nerdcommenter'
"Plug 'vim-scripts/doxygen-support.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
"Plug 'kkoomen/vim-doge'

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do' : 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }

Plug 'sbdchd/neoformat'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

Plug 'donRaphaco/neotex', { 'for': '.tex' }

Plug 'mklabs/vim-cowsay'
Plug 'fadein/vim-FIGlet'

call plug#end()
