#!/bin/zsh
##zshrc

#prompt
#PS1="%B[%F{cyan}%n%f@%F{yellow}%M%f] in %F{red}%~%f
#%F{magenta}->%f%b "

#set shell options
setopt share_history autocd

# Set config for history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$HOME/.config/zsh/zsh_history"

#Use vim keys in tab complete menu
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#include hidden files in autocomplete:
_comp_options+=(globdots)

#enable case INsensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

#bind reverse history search to CTRL-R, like in bash
bindkey '^R' history-incremental-pattern-search-backward

#load additional plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

#Load aliases
[ -f "$HOME/.config/alias.sh" ] && source "$HOME/.config/alias.sh"

#spaceship prompt
autoload -U colors && colors
#define order
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  jobs          # Background jobs indicator
  char          # Prompt character
)
#customize the prompt
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_USER_PREFIX=[
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX=''
SPACESHIP_HOST_PREFIX=@
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_SUFFIX=]
SPACESHIP_DIR_PREFIX=' in '
SPACESHIP_DIR_TRUNC=0

autoload -U promptinit; promptinit
prompt spaceship
