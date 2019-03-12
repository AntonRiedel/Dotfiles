###############################################################################
#     File Name           :     .zshrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:40]
#     Last Modified       :     [2019-03-12 18:22]
#     Description         :     zshrc
###############################################################################

#oh-my-zsh setup
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

#source aliases
[ -f "$HOME/.config/shell/alias.sh" ] && source "$HOME/.config/shell/alias.sh"
