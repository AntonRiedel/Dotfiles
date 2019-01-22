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
autocmd BufEnter * set updatetime=1000
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
nnoremap <space> za
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
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'rafaqz/ranger.vim'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'mklabs/vim-cowsay'
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

" Tex/Text files {{{
" live preview
let g:livepreview_previewer = 'zathura'
autocmd BufEnter *.tex set updatetime=50 
" Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c
" spell checking 
autocmd BufRead,BufNewFile *.txt,*.tex setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt,*.tex set complete+=kspell
autocmd BufRead,BufNewFile *.txt,*.tex set spellfile=~/.vim/spell/en_us.utf-8.add
" set highligthing of misspelled words
autocmd BufRead,BufNewFile *.txt,*.tex hi clear SpellBad
autocmd BufRead,BufNewFile *.txt,*.tex hi SpellBad cterm=underline ctermfg=red
"}}} 

" YouCompleteMe {{{
" set interpreter to python2 to make python2-jedi work
let g:ycm_python_interpreter_path = '/usr/bin/python2'
" }}}

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
" source .vimrc after saving any changes
autocmd BufWritePost .vimrc source $MYVIMRC
autocmd BufWritePost ~/.Xresources !xrdb %
"}}}

" Custom  Shortcuts {{{
inoremap jj <ESC>
map <leader>c :w! \| !compiler <c-r>%<CR><CR>
map <leader>p :!opout <c-r>%<CR><CR>
"}}}

" vim:foldmethod=marker:foldlevel=0
