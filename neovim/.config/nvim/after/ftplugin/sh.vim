" File              : sh.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 08.10.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for bash scirpts

"set make program
setlocal makeprg=/usr/bin/bash\ \%

"set format program
setlocal formatprg=shfmt
setlocal equalprg=shfmt

"autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
augroup END
