" File              : cpp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 18.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for cpp files

"set make program
setlocal makeprg=cmake\ --build\ build

"set format program
setlocal formatprg=astyle
setlocal equalprg=astyle

"autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * :call format#Format()
augroup END
