" File              : markdown.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 12.07.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for cpp files

"set tabwidth
setlocal tabstop=4
setlocal shiftwidth=4

"set make program
setlocal makeprg=pandoc\ %\ -o\ %:r.pdf

"set format program
" setlocal formatprg=clang-format
" setlocal equalprg=clang-format

" " autoformat files on save
" augroup Format
"     autocmd!
"     autocmd BufWritePre * AddHeader
"     autocmd BufWritePre * undojoin | Neoformat
" augroup END
