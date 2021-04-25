" File              : lua.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 24.04.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for lua files

"set tabwidth
setlocal tabstop=4
setlocal shiftwidth=4

"set make program
setlocal makeprg=lua\ \%

"set format program
setlocal formatprg=lua-format
setlocal equalprg=lua-format

"autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
    autocmd BufWritePost * edit
augroup END
