" File              : lsp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 23.11.2020
" Last Modified Date: 24.04.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"lsp setup

lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.bashls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}

"treesitter config
lua require'nvim-treesitter.configs'.setup { ensure_installed = { "bash", "c", "cpp", "python","lua" } , highlight = { enable = true }, }
" indent = { enable = true },
" refactor = {
"   highlight_definitions = { enable = true },
"   highlight_current_scope = { enable = true }
" }

"generic options
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact','fuzzy','substring']
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_paren = 1
let g:completion_matching_ignore_case = 1
let g:completion_trigger_keyword_length=1
"let g:completion_trigger_character = []

"keybinds for lsp
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
inoremap <expr> <C-p> pumvisible() ? "\<C-p>" : "\<C-n>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

nnoremap <silent> <leader>ld  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lh  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>li  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lr  <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lrn <cmd>lua vim.lsp.buf.rename()<CR>

"keybindings for diagnostics
nnoremap <silent> <leader>dn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>dp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

" nnoremap <silent> <leader>ls  <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> <leader>lt  <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> <leader>ldd <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> <leader>nf    <cmd>lua vim.lsp.buf.formatting()<CR>
