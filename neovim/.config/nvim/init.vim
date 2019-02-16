" Misc {{{
set backspace=indent,eol,start
let mapleader=" "
set clipboard=unnamed
set mouse=a
set encoding=utf-8
set fileformat=unix
set wrap
set linebreak
set nobackup
set noswapfile
filetype indent on
filetype plugin on
"}}}

" UI Layout {{{
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
set autoindent
"}}}

" Searching {{{
set ignorecase
set incsearch
set hlsearch
"}}}

" Spaces and Tabs {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set modelines=1
"}}}

" Folding {{{
set foldenable
set foldmethod=indent
set foldlevelstart=3
"}}}

" Vim-Plug {{{
call plug#begin() 
Plug 'iCyMind/NeoSolarized'
Plug 'mboughaba/i3config.vim'
Plug 'itchyny/lightline.vim'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'sbdchd/neoformat'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vhdirk/vim-cmake'

Plug 'mklabs/vim-cowsay'
Plug 'fadein/vim-FIGlet'
call plug#end()
"}}}

" Deoplete {{{
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"}}}}

" NeoSolarized {{{
syntax enable
colorscheme NeoSolarized
"}}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" }}}

" Tex/Markdown/Text files {{{
let g:tex_flavor="latex"
let g:neotex_pdflatex_alternative="xelatex"
let g:neotex_delay="500"
"Compile documents
nnoremap <leader>lv :silent !zathura %:r.pdf &<CR>
" Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c
" spell checking 
autocmd BufRead,BufNewFile *.txt,*.tex,*.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt,*.tex,*.md set complete+=kspell
autocmd BufRead,BufNewFile *.txt,*.tex,*.md set spellfile=~/.vim/spell/en_us.utf-8.add
" set highligthing of misspelled words
autocmd BufRead,BufNewFile *.txt,*.tex,*.md hi clear SpellBad
autocmd BufRead,BufNewFile *.txt,*.tex,*.md hi SpellBad cterm=underline ctermfg=red
"}}} 

" vim-Cmake {{{
let g:cmake_ycm_symlinks=1
nnoremap <leader>cm :CMake<CR>
nnoremap <leader>cc :CMakeClean<CR>
nnoremap <leader>m :AsyncRun make<CR>
"}}}

" Autoformat {{{
autocmd BufWritePre *.c,*.h,*.cpp,*.md,*.py,*.sh Neoformat
"}}}

" AutoCommands {{{
autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd BufWritePost ~/.Xresources !xrdb %
"}}}

" Custom Shortcuts {{{
inoremap jj <ESC>
cnoremap sw execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"}}}

" vim:foldmethod=marker:foldlevel=0
