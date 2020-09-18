" File              : python.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 18.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for python files

"set make program
setlocal makeprg=python\ \%

"set format program
setlocal formatprg=yapf
setlocal equalprg=yapf

"autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * :call format#Format()
augroup END

