"------------------------------------------------------------------------------
"     File Name           :     03.graphical.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:34]
"     Last Modified       :     [2019-02-26 15:15]
"     Description         :     Configuration for GUI
"------------------------------------------------------------------------------

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
set list
set laststatus=2
set lazyredraw
set showmatch
set colorcolumn=80

" NeoSolarized
set termguicolors
syntax enable
set background=dark
let g:neosolarized_visibility = "high"
colorscheme NeoSolarized

" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"Signify
let g:signify_vcx_list = ['git']
let g:signify_realtime = 1
