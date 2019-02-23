"07.autocommands.vim
"set autocommands 

"Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,.tex,*.md,*.py,*.sh Neoformat
"autocmd BufWritePre *.tex !latexindent  -m -y="modifyLineBreaks:textWrapOptions:columns:80" -w %
"Neomake
autocmd BufWritePost,BufEnter * Neomake
