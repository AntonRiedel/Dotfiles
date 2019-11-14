"------------------------------------------------------------------------------
"     File Name           :     init.vim
"     Created By          :     Anton Riedel <anton.riedel@tum.de>
"     Creation Date       :     [2019-02-23 23:57]
"     Last Modified       :     [2019-03-14 23:28]
"     Description         :     Central config file for neovim
"------------------------------------------------------------------------------

"split configuration across serveral files
for config in split(glob('$HOME/.config/nvim/config/*.vim'), '\n')
    exe 'source' config
endfor
