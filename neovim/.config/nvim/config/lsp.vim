" File              : lsp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 18.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"start language server
lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.texlab.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.bashls.setup{ on_attach=require'completion'.on_attach }


"setup for neovim's builtin lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>nf    <cmd>lua vim.lsp.buf.formatting()<CR>

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact','substring','fuzzy']
