"------------------------------------------------------------------------------
"     File Name           :     03.graphical.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-02-23 19:34]
"     Last Modified       :     [2020-02-05 11:08]
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

" lightline and lightline-bufferline
let g:lightline = {'colorscheme': 'powerline'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier=':t'
set showtabline=2

"Signify
let g:signify_vcx_list = ['git']
let g:signify_realtime = 1
