" File              : 05.autocommands.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 27.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"Reload init.vim if a config file gets changed
autocmd BufWritePost *.vim source $MYVIMRC

"Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,*.hpp,CMakeLists.txt,*.tex,*.md,*.py,*.sh Neoformat

"Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c

"Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
