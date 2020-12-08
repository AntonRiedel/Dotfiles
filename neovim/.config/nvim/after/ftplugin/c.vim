" File              : c.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 11.11.2020
" Last Modified Date: 04.12.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for c files

"protect against overwriting cpp-specific configurations
if (&ft != 'c')
    finish
endif

"set tabwidth
setlocal tabstop=2
setlocal shiftwidth=2

"set make program
setlocal makeprg=make

"set format program
setlocal formatprg=clang-format
setlocal equalprg=clang-format

"autoformat files on save
" augroup Format
"     autocmd!
"     autocmd BufWritePre * AddHeader
"     autocmd BufWritePre * undojoin | Neoformat
" augroup END
