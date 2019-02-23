"07.autocommands.vim
"set autocommands 

"Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,*.md,*.py,*.sh Neoformat

"Neomake
autocmd BufWritePost,BufEnter * Neomake

"resource init.vim
autocmd BufWritePost ~/.config/nvim/init.vim ~/.config/nvim/config/*.vim source ~/.config/nvim/init.vim

"resource bashrc
autocmd BufWritePost ~/.bashrc source ~/.bashrc
