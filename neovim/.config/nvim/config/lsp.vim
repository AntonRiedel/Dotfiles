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

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['exact','substring','fuzzy']
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'UltiSnips'
