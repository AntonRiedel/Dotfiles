"------------------------------------------------------------------------------
"     File Name           :     06.deoplete.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-02-23 19:35]
"     Last Modified       :     [2020-03-24 18:36]
"     Description         :     Configuration for deoplete-{clang,jedi}
"------------------------------------------------------------------------------

let g:python_host_prog="/usr/bin/python"

"start deoplete at startup
let g:deoplete#enable_at_startup = 1
"change keybinding for selecting options in deoplete menu
"works nicely with
"<C-j> -> down
"<C-k> -> up
"<C-u> -> expand snippet
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
