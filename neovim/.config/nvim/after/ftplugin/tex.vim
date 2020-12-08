" File              : tex.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 21.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for tex files

"set make program
setlocal makeprg=latexmk\ -pdf

"set format program
setlocal formatprg=latexindent
setlocal equalprg=latexindent

"autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
    autocmd BufWritePre * undojoin | Neoformat
    autocmd VimLeave * :!latexmk -C
augroup END
