"------------------------------------------------------------------------------
"     File Name           :     init.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 23:57]
"     Last Modified       :     [2019-02-26 15:29]
"     Description         :     Central config file for neovim
"------------------------------------------------------------------------------

"split configuration across serveral files
for config in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' config
endfor
