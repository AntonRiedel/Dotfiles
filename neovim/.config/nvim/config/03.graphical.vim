" File              : 03.graphical.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 30.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"UI Layout
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

"quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_lazy_highlight = 1
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

"NeoSolarized
set termguicolors
syntax enable
set background=dark
let g:neosolarized_visibility = "high"
colorscheme NeoSolarized

"lightline and lightline-bufferline
let g:lightline = {'colorscheme': 'powerline'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier=':t'
set showtabline=2

"Signify
let g:signify_vcx_list = ['git']
let g:signify_realtime = 1

