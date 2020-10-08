" File              : ToggleTerminal.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 07.10.2020
" Last Modified Date: 07.10.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

let s:TerminalisOpen = 1

function! ToggleTerminal() abort
    if s:TerminalisOpen
        vnew +terminal
        let s:TerminalisOpen = 0
    else
        echo "To be implemented"
        let s:TerminalisOpen = 1
    endif
endfunction
