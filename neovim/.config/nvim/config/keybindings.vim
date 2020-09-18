" File              : keybindings.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 18.09.2020
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
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
inoremap <c-h> <Esc><c-w>h
inoremap <c-j> <Esc><c-w>j
inoremap <c-k> <Esc><c-w>k
inoremap <c-l> <Esc><c-w>l
vnoremap <c-h> <Esc><c-w>h
vnoremap <c-j> <Esc><c-w>j
vnoremap <c-k> <Esc><c-w>k
vnoremap <c-l> <Esc><c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l  

"open terminal in a split to the left
nnoremap <leader>tv :vsplit term://bash<CR>
"open terminal in a split to down
nnoremap <leader>th :split term://bash<CR>
"source init.vim after making changes
nnoremap <leader>sv :source $MYVIMRC<CR>
"edit config file in a split
nnoremap <leader>ev :Files $HOME/.config/nvim/<CR>
"open up file tree
" nnoremap <leader>pv :wincmd v<bar> :Lexplore <bar> :vertical resize 25<CR>
nnoremap <leader>pv :Lexplore<CR>

"setup for neovim's builtin lsp
nnoremap <silent> <leader>ld  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lh  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>ls  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lt  <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>lr  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lrn <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> <leader>ldd <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> <leader>nf    <cmd>lua vim.lsp.buf.formatting()<CR>
