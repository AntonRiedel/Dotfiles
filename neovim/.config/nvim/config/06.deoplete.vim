"--------------------------------------------------------------------------------
"     File Name           :     06.deoplete.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:35]
"     Last Modified       :     [2019-02-23 19:36]
"     Description         :     Configuration for deoplete-{clang,jedi}
"--------------------------------------------------------------------------------

"start deoplete at startup
let g:deoplete#enable_at_startup = 1

"deoplete-clang
let g:deoplete#sources#clang#libclang_path="/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header="/usr/lib/clang/7.0.1/include"

"deoplete-jedi
let g:deoplete#sources#jedi#python_path="/usr/bin/python2"
