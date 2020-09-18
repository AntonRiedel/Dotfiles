" File              : 09.neoformat.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 24.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"tex
let g:neoformat_enabled_tex = [ 'latexindent' ]
"latexindent
"let g:neoformat_tex_latexindent = {
    "\ 'exe': 'latexindent',
    "\ 'args': ['-m', '-y="modifyLineBreaks:textWrapOptions:columns:80"'],
    "\ 'stdin': 1
    "\ }

"c
let g:neoformat_enabled_c = [ 'astyle' ]

"cpp
let g:neoformat_enabled_cpp = [ 'astyle' ]

"python
let g:neoformat_enabled_python = [ 'black' ]

"shell
let g:neoformat_enabled_sh = [ 'shfmt' ]
let g:shfmt_opt="-ci"

" Enable alignment if filetype not found
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion if filetype not found
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace if filetype not found
let g:neoformat_basic_format_trim = 1
