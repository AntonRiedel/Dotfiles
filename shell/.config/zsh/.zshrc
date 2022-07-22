#!/bin/zsh
# File              : .zshrc
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 30.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#prompt
PS1="%B[%F{cyan}%n%f@%F{yellow}%M%f] %F{red}%~%f
%F{magenta}>%f%b "

#set shell options
setopt share_history HIST_IGNORE_ALL_DUPS autocd

# Set config for history
HISTSIZE=10000
SAVEHIST=10000

#enable vi mode
bindkey -v
KEYTIMEOUT=1

#switch to vim buffer
autoload edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line

#Use vim keys in tab complete menu
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#fix backspace bug
bindkey "^?" backward-delete-char

#include hidden files in autocomplete:
_comp_options+=(globdots)

#enable case INsensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

#load additional plugins
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
#backward search
# bindkey '^R'    history-incremental-search-backward

#Load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
