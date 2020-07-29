" File              : init.vim
" Author            : Anton Riedel <anton.riedel@tum.de>
" Date              : 24.03.2020
" Last Modified Date: 24.03.2020
" Last Modified By  : Anton Riedel <anton.riedel@tum.de>

"split configuration across serveral files
for config in split(glob('$HOME/.config/nvim/config/*.vim'), '\n')
    exe 'source' config
endfor
