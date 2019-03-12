###############################################################################
#     File Name           :     .zshrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:40]
#     Last Modified       :     [2019-03-12 17:47]
#     Description         :     zshrc
###############################################################################

#misc settings for zsh shell
autoload -Uz compinit promptinit
compinit
promptinit

#path to oh-my-zsh
ZSH=/usr/share/oh-my-zsh/

#set theme
ZSH_THEME="trapd00r"
#"agnoster"

#oh-my-zsh plugins
#plugins=(
#)

#active oh-my-zsh
source $ZSH/oh-my-zsh.sh

#source aliases
[ -f "$HOME/.config/shell/alias.sh" ] && source "$HOME/.config/shell/alias.sh"
