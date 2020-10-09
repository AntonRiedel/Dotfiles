" File              : vim.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 08.10.2020
" Last Modified Date: 08.10.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

augroup Format
    autocmd!
    autocmd BufWritePre * AddHeader
augroup END
