" File              : cmake.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 21.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for cpp files

"set make program
" setlocal makeprg=cmake\ --build\ build
setlocal makeprg=mkdir\ -p\ build\ &&\ cmake\ -S\ \.\ -B\ build\ &&\ cmake\ --build\ build

"set format program
"setlocal formatprg=cmake-format
"setlocal equalprg=cmake-format

"autoformat files on save
" augroup Format
"     autocmd!
"     autocmd BufWritePre * undojoin | Neoformat
" augroup END
