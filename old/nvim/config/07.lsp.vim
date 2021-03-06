" File              : 07.lsp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 24.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'cpp': ['/usr/bin/clangd'],
    \ 'c': ['/usr/bin/clangd'],
    \ 'cmake': ['/usr/bin/cmake-language-server'],
    \ 'tex': ['/usr/bin/texlab'],
    \ 'sh': ['/usr/bin/bash-language-server','start'],
    \ }
"\ 'fortran': ['/usr/bin/fortls'],

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
