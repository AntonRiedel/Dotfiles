##zshrc

git_prompt() {
    git symbolic-ref --short HEAD 2> /dev/null
}

#prompt
autoload -U colors && colors
autoload prompt_subst
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b
#->"
PS1="%B[%F{green}%n%f@%F{yellow}%M%f] in %F{red}%~%f
%F{magenta}->%f%b "

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

# Include hidden files in autocomplete:
_comp_options+=(globdots)

#case INsensitive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

#bind reverse history search to CTRL-R, like in bash
bindkey '^R' history-incremental-pattern-search-backward

#load additional plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
#Load aliases
[ -f "$HOME/.config/zsh/alias.sh" ] && source "$HOME/.config/zsh/alias.sh"
