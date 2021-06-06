" File              : rust.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 06.06.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for cpp files

"set tabwidth
setlocal tabstop=4
setlocal shiftwidth=4

"set make program
setlocal makeprg=cargo\ run

"set format program
setlocal formatprg=rustfmt
setlocal equalprg=rustfmt

" autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
    autocmd BufWritePost * edit
augroup END
