" File              : format.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 17.09.2020
" Last Modified Date: 19.09.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"format any file if formatprg is properly set
function! format#Format() abort
    if &modified
        "save current cursor position
        let cursor_pos = getpos('.')
        "go to the beginning of the file (gg)
        "use gq operator for formatting
        "to the end of the file (G)
        :normal gggqG
        "place the cursor at the original positon
        call setpos('.', cursor_pos)
    endif
endfunction
