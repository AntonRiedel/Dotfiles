#!/bin/sh
# File              : fin.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

ClearCache() {
    history -c
    rm -rf $HOME/.cache/* $HOME/.*history $HOME/.*hst* $HOME/.*bookmark* $HOME/.*thumb* $HOME/.rdesktop $HOME/.pki $HOME/.fltk
}

pgrep -x dmenu && exit

choice=$(echo "Shutdown\nReboot\nExit\nLock Screen" | dmenu -i -p "Select Option:")

case "$choice" in
Shutdown) ClearCache && /usr/bin/shutdown now ;;
Reboot) ClearCache && /usr/bin/reboot ;;
"Exit") killall Xorg ;;
"Lock Screen") lockscreen.sh ;;
esac
