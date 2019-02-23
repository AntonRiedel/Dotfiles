"07.neoformat.vim
"set options for neoformat

"give option to latexindent
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


