" .vimrc
 
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
set foldmethod=indent
set foldnestmax=10
set foldenable
set foldlevelstart=10
"}}}

" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/badwolf'
Plugin 'mboughaba/i3config.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'rafaqz/ranger.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vhdirk/vim-cmake'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Chiel92/vim-autoformat.git'
Plugin 'godlygeek/tabular'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'mklabs/vim-cowsay'
Plugin 'fadein/vim-FIGlet'
call vundle#end()
"}}}

" badwolf {{{
syntax enable 
colorscheme badwolf
let g:badwolf_darkgutter=1
let g:badwolf_tabline=3
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
" Compile documents
nnoremap <leader>lk :w! \| :AsyncRun latexmk -xelatex<CR>
nnoremap <leader>pk :w! \| :Pandoc! pdf<CR>
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

" YouCompleteMe {{{
" set interpreter to python2 to make python2-jedi work
let g:ycm_python_interpreter_path = '/usr/bin/python2'
" }}}

" Autoformat {{{
autocmd BufWritePre *.c,*.h,*.cpp,*.md,*.py,*.sh Autoformat
"}}}

" AsyncRun {{{
:let g:asyncrun_open=8
"}}}

" Vimux {{{
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>

"}}}

" Ranger {{{
map <leader>rr :RangerEdit<cr>
map <leader>rv :RangerVSplit<cr>
map <leader>rs :RangerSplit<cr>
map <leader>rt :RangerTab<cr>
map <leader>ri :RangerInsert<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
"}}}

" AutoCommands {{{
autocmd BufWritePost ~/.vimrc source $MYVIMRC
autocmd BufWritePost ~/.Xresources !xrdb %
"}}}

" Custom Shortcuts {{{
inoremap jj <ESC>
cnoremap sw execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
"}}}

" vim:foldmethod=marker:foldlevel=0
