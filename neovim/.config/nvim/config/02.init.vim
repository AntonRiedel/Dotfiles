"------------------------------------------------------------------------------
"     File Name           :     02.init.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-02-23 19:33]
"     Last Modified       :     [2020-03-23 12:34]
"     Description         :     Basic configuration for Neovim
"------------------------------------------------------------------------------

"Misc
set backspace=indent,eol,start
let mapleader=" "
set clipboard=unnamedplus
set mouse=a
set fileencoding=utf-8
set fileformat=unix
filetype on
filetype plugin on
filetype plugin indent on
set nobackup
set noswapfile
set wrap
set linebreak
set smartindent

"Searching
set ignorecase
set incsearch
set hlsearch
set smartcase

"Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

"Folding
set foldenable
set foldmethod=indent
set foldlevelstart=99
