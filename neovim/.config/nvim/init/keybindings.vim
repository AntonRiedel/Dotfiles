" File              : keybindings.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 23.03.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"global keybindings
let mapleader=' '

"terminal mode
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
autocmd TermOpen * startinsert

"easy-align
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

"open terminal in a split to the left
nnoremap <leader>tv :vsplit<CR>:terminal<CR>
"open terminal in a split to down
nnoremap <leader>th :split<CR>:terminal<CR>
"source init.vim after making changes
nnoremap <leader>sv :source $MYVIMRC<CR>
"edit config file in a split
nnoremap <leader>ev :Files $HOME/.config/nvim/<CR>
"open up file tree
nnoremap <leader>pv :Lexplore<CR>
"delete visual selection and replace it the content of the unnamed register
"i.e. whatever you yanked last
vnoremap <leader>p "_dP

nnoremap <leader>bb :Buffers<CR>

"keybinds for neovim's builtin lsp
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
