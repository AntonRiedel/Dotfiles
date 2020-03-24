" File              : 02.init.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 24.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"Misc
let mapleader=" "

set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a

set fileencoding=utf-8
set fileformat=unix
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
