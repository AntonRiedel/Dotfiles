" File              : 06.deoplete.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 26.03.2020
" Last Modified Date: 26.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"start deoplete at startup
let g:deoplete#enable_at_startup = 1
"change keybinding for selecting options in deoplete menu
"works nicely with
"<C-j> -> down
"<C-k> -> up
"<C-u> -> expand snippet
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
