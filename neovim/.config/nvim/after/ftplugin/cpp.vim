" File              : cpp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 27.01.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for cpp files

"set tabwidth
setlocal tabstop=2
setlocal shiftwidth=2

"set make program
" setlocal makeprg=cmake\ --build\ build
setlocal makeprg=mkdir\ -p\ build\ &&\ cmake\ -S\ \.\ -B\ build\ &&\ cmake\ --build\ build

"set format program
setlocal formatprg=clang-format
setlocal equalprg=clang-format

" autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
augroup END
