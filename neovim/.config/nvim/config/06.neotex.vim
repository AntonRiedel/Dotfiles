"06.neotex.vim
"Configuration of neotex

let g:tex_flavor="latex"
let g:neotex_pdflatex_alternative="xelatex"
let g:neotex_delay="300"
"View documents
nnoremap <leader>lv :silent !zathura %:r.pdf &<CR>
"Clear out build files when leaving .tex document
autocmd VimLeave *.tex !latexmk -c

