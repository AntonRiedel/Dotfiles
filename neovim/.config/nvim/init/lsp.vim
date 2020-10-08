" File              : lsp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 14.09.2020
" Last Modified Date: 08.10.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"start language server
lua require'nvim_lsp'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.texlab.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.bashls.setup{ on_attach=require'completion'.on_attach }
" lua require'nvim_lsp'.cmake.setup{ on_attach=require'completion'.on_attach }

"add diagnostics
lua require'nvim_lsp'.clangd.setup{ on_attach=require'diagnostic'.on_attach }
lua require'nvim_lsp'.pyls.setup{ on_attach=require'diagnostic'.on_attach }
lua require'nvim_lsp'.texlab.setup{ on_attach=require'diagnostic'.on_attach }
lua require'nvim_lsp'.bashls.setup{ on_attach=require'diagnostic'.on_attach }

"treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "c", "cpp", "python" } ,
  highlight = { enable = true, },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
  },
}
EOF

"generic options
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list=['fuzzy','substring','exact']
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_paren = 1
let g:completion_matching_ignore_case = 1
let g:neoformat_try_formatprg = 1
let g:diagnostic_enable_virtual_text = 1
