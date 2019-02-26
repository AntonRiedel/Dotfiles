"------------------------------------------------------------------------------
"     File Name           :     09.neotex.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:37]
"     Last Modified       :     [2019-02-26 15:20]
"     Description         :     Configuration for NeoTex
"------------------------------------------------------------------------------

let g:tex_flavor="latex"
"pdflatex is not properly working (on Parabola GNU/Linux), therefore
let g:neotex_pdflatex_alternative="xelatex"
let g:neotex_delay="200"
