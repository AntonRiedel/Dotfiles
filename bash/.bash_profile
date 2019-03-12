###############################################################################
#     File Name           :     .bash_profile
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:41]
#     Last Modified       :     [2019-03-12 19:43]
#     Description         :     bash_profile
###############################################################################

#source environment variables
[ -f "$HOME/.config/shell/environment.sh" ] && source "$HOME/.config/shell/environment.sh"

#source bashrc
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

#start window manager on login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx --vt1 &> /dev/null
fi
