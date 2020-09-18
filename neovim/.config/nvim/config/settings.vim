" File              : settings.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 14.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>
"
"global setting
filetype plugin indent on         " Add filetype, plugin, and indent support
syntax on                         " Turn on syntax highlighting
set shell=/usr/bin/bash           " Prefer bash for shell-related tasks
set tabstop=4                     " set how many spaces is one tab
set shiftwidth=4                  " set to tabstop
set expandtab                     " Prefer spaces over tabs
set hidden                        " Prefer hiding over unloading buffers
set path=.,,**                    " Search relative to current file + directory
set noswapfile                    " No swapfiles
set tags=./tags;,tags;            " ID Tags relative to current file + directory
set shiftwidth=4                  " Indentation defaults (<< / >> / == / auto)
set shiftround                    " Snap indents via > or < to multiples of sw
set clipboard+=unnamedplus        " Always use the clipboard
set backspace=indent,eol,start    " Make backspace behave as expected in insert mode
set mouse=a                       " enable the mouse in all modes
set ignorecase                    " ignore case when searching
set smartcase                     " override ignorecase if upper case letters are used
set incsearch                     " highlight matches as you are typing the pattern
set hlsearch                      " highlight matches of the previous search
set splitright splitbelow         " make spilts appear where you expect them to appear
set list                          " make whitespace appear
set number                        " print line number
set relativenumber                " print relative line number
set cursorline cursorcolumn       " spot the cursor easier
