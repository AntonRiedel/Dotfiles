" File              : python.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 23.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for python files

"set tabwidth
setlocal tabstop=4
setlocal shiftwidth=4

"set make program
setlocal makeprg=python\ \%

"set format program
setlocal formatprg=yapf
setlocal equalprg=yapf

"autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
