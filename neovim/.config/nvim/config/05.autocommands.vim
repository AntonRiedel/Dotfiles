"07.autocommands.vim
"set autocommands

"Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,.tex,*.md,*.py,*.sh Neoformat

"Neomake
autocmd BufWritePost,BufEnter * Neomake

"Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c

