"------------------------------------------------------------------------------
"     File Name           :     08.neoformat.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:36]
"     Last Modified       :     [2019-03-15 13:36]
"     Description         :     Configuration for Neoforamt
"------------------------------------------------------------------------------

"latexindent
let g:neoformat_tex_latexindent = {
    \ 'exe': 'latexindent',
    \ 'args': ['-m', '-y="modifyLineBreaks:textWrapOptions:columns:80"'],
    \ 'stdin': 1
    \ }
let g:neoformat_enabled_tex = [ 'latexindent' ]

" Enable alignment if filetype not found
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion if filetype not found
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace if filetype not found
let g:neoformat_basic_format_trim = 1
