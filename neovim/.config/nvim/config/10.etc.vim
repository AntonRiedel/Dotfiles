" Deoplete
""inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
""inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" spell checking 
autocmd BufRead,BufNewFile *.txt,*.tex,*.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt,*.tex,*.md set complete+=kspell
autocmd BufRead,BufNewFile *.txt,*.tex,*.md set spellfile=~/.vim/spell/en_us.utf-8.add
" set highligthing of misspelled words
autocmd BufRead,BufNewFile *.txt,*.tex,*.md hi clear SpellBad
autocmd BufRead,BufNewFile *.txt,*.tex,*.md hi SpellBad cterm=underline ctermfg=red

" vim-Cmake
let g:cmake_ycm_symlinks=1
nnoremap <leader>cm :CMake<CR>
nnoremap <leader>cc :CMakeClean<CR>
nnoremap <leader>m :AsyncRun make<CR>

" Autoformat
autocmd BufWritePre *.c,*.h,*.cpp,*.md,*.py,*.sh Neoformat

" AutoCommands
autocmd BufWritePost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
autocmd BufWritePost ~/.Xresources !xrdb %


