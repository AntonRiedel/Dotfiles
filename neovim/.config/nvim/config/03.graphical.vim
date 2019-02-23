" 03.graphical.vim

" UI Layout
set number
set relativenumber
set ruler
set showcmd
set showmode
set cursorline
set splitbelow
set splitright
set wildmenu
set hidden
set laststatus=2
set lazyredraw
set showmatch
set colorcolumn=80

" NeoSolarized
set termguicolors
syntax enable
colorscheme NeoSolarized

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
