" File              : keybindings.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 14.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"global keybindings
let mapleader=' '

"self-explanatory convenience mappings
inoremap jj <Esc>
vnoremap ; :
vnoremap : ;
nnoremap ; :
nnoremap : ;

"terminal mode
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert

"h-j-k-l mode-agnostic means of switching windows
tnoremap <M-h> <c-\><c-n><c-w>h
tnoremap <M-j> <c-\><c-n><c-w>j
tnoremap <M-k> <c-\><c-n><c-w>k
tnoremap <M-l> <c-\><c-n><c-w>l
inoremap <M-h> <Esc><c-w>h
inoremap <M-j> <Esc><c-w>j
inoremap <M-k> <Esc><c-w>k
inoremap <M-l> <Esc><c-w>l
vnoremap <M-h> <Esc><c-w>h
vnoremap <M-j> <Esc><c-w>j
vnoremap <M-k> <Esc><c-w>k
vnoremap <M-l> <Esc><c-w>l
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l  

"open terminal in a split to the left
nnoremap <leader>tv :vsplit term://bash<CR>
"open terminal in a split to down
nnoremap <leader>th :split term://bash<CR>
"source init.vim after making changes
nnoremap <leader>sv :source $MYVIMRC<CR> 
"edit config file in a split
nnoremap <leader>ev :vsplit $MYVIMCONFIG<CR>
"open up file tree
" nnoremap <leader>pv :wincmd v<bar> :Lexplore <bar> :vertical resize 25<CR>
nnoremap <leader>pv :Lexplore<CR>
