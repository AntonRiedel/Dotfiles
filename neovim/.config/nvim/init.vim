"--------------------------------------------------------------------------------
"     File Name           :     /home/anton/.config/nvim/init.vim
"     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
"     Creation Date       :     [2019-02-23 19:38]
"     Last Modified       :     [2019-02-23 20:29]
"     Description         :     Main configuration file for Neovim
"--------------------------------------------------------------------------------

"split configuration across serveral files
for config in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' config
endfor
