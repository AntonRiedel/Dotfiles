" File              : 05.autocommands.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 05.05.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"Reload init.vim if a config file gets changed
augroup Vimrc
    autocmd!
    autocmd BufWritePost *.vim source $MYVIMRC
augroup END

"Autoformat before wrting
"Update header before writing
augroup Format
    autocmd!
    autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,CMakeLists.txt,*.tex,*.md,*.py,*.sh Neoformat
    autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,CMakeLists.txt,*.tex,*.md,*.py,*.sh AddHeader
augroup END

"Clear out build files when leaving .tex document
augroup Latex
    autocmd!
    autocmd VimLeave *.tex !latexmk -c
augroup END

"Disables automatic commenting on newline:
augroup All
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
