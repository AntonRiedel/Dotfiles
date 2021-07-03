" File              : cpp.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 16.09.2020
" Last Modified Date: 02.07.2021
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"settings for cpp files

"set comment string for commentary.vim
setlocal commentstring=//\ %s

"set tabwidth
setlocal tabstop=2
setlocal shiftwidth=2

"set make program
" setlocal makeprg=cmake\ --build\ build
if expand('%:e')=='C'
    setlocal makeprg=root\ -q\ -l\ -b\ %
	nnoremap <leader>rb :!rootbrowse
else
    setlocal makeprg=mkdir\ -p\ build\ &&\ cmake\ -S\ \.\ -B\ build\ &&\ cmake\ --build\ build
endif

"set format program
setlocal formatprg=clang-format
setlocal equalprg=clang-format

" autoformat files on save
augroup Format
    autocmd!
    autocmd BufWritePre * undojoin | AddHeader
    autocmd BufWritePre * undojoin | Neoformat
    autocmd BufWritePost * edit
augroup END
