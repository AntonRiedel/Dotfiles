"07.neoformat.vim
"set options for neoformat

"give option to latexindent
let g:neoformat_tex_latexindent = {
    \ 'exe': 'latexindent',
    \ 'args': ['-m', ' -y="modifyLineBreaks:textWrapOptions:columns:80" '],
    \ 'stdin': 1
    \ }
let g:neoformat_enabled_tex = [ 'latexindent' ]
