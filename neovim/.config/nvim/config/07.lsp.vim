"--------------------------------------------------------------------------------
"     File Name           :     07.lsp.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-12-03 22:46]
"     Last Modified       :     [2020-02-26 10:32]
"     Description         :     Configuration for language server protocol
"--------------------------------------------------------------------------------

set hidden
let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/bin/pyls'],
    \ 'cpp': ['/usr/bin/clangd'],
    \ 'c': ['/usr/bin/clangd'],
    \ 'fortran': ['/usr/bin/fortls'],
    \ 'cmake': ['/usr/bin/cmake-language-server'],
    \ 'tex': ['/usr/bin/texlab'],
    \ 'sh': ['/usr/bin/bash-language-server'],
    \ }

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
