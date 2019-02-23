"07.neoformat.vim
"set options for neoformat

"give option to latexindent
let g:neoformat_latex_latexindent = {
    \ 'exe': 'latexindent',
    \ 'args': ['-m','-y="modifyLineBreaks:textWrapOptions:columns:80"'],
    \ }
let g:neoformat_enable_latex = [ 'latexindent' ]
