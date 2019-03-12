###############################################################################
#     File Name           :     .zprofile
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:41]
#     Last Modified       :     [2019-03-12 17:16]
#     Description         :     zprofile
###############################################################################

#source environment variables
[ -f "$HOME/.config/shell/environment.sh" ] && source "$HOME/.config/shell/environment.sh"

#source zshrc
[ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"

##start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
