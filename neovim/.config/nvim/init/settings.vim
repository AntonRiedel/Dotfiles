" File              : settings.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 04.12.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"global setting
filetype plugin on                " Add filetype plugin support
filetype indent on                " Add filetype indent support
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
let g:python3_host_prog="/usr/bin/python3" " set python interpreter for better startup time
let g:loaded_python_provider=0    " dont use python2
let g:loaded_ruby_provider=0      " dont use ruby
let g:loaded_node_provider=0      " dont use node
let g:loaded_perl_provider=0      " dont use perl
set grepprg=rg\ --vimgrep\ --smart-case " use ripgrep for grepping
autocmd BufRead,BufNewFile *.h,*.c set filetype=c " fix filetype for .c and .h files
autocmd TermOpen * startinsert    " start terminal in insert mode

"global graphical settings
set termguicolors " use truecolor
set showtabline=2 " always show tab page labels
colorscheme gruvbox " grubvbox colorscheme
set background=dark " use dark variant

"config for netrw (-> best open with :Lexplore)
let g:netrw_liststyle=3             "list files with tree style
let g:netrw_banner=0                "remoeve annyoing banner
let g:netrw_winsize = 25            "let netrew only take 25% of the screen


"keybindings
let mapleader=' '

"self-explanatory convenience mappings
vnoremap ; :
vnoremap : ;
nnoremap ; :
nnoremap : ;

"get ridd of bad habits
" nnoremap jj <Nop>
" nnoremap kk <Nop>
" nnoremap ll <Nop>
" nnoremap hh <Nop>

"handle escape from fzf promt gracefully
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

"open terminal in a split to the left
nnoremap <leader>tv :vsplit<CR>:terminal<CR>
"open terminal in a split to down
nnoremap <leader>th :split<CR>:terminal<CR>
"source init.vim after making changes
nnoremap <leader>sv :source $MYVIMRC<CR>
"edit config file in a new buffer
nnoremap <leader>ev :Files $HOME/.config/nvim/<CR>
"toggle filetree with netrw
nnoremap <leader>pv :Lexplore<CR>
"delete visual selection and replace it the content of the unnamed register
"i.e. whatever you yanked last
vnoremap <leader>p "_dP
