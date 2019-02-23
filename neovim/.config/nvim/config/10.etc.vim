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
