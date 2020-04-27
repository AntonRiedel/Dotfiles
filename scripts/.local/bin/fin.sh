#!/bin/sh
# File              : fin.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 27.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

ClearCache() {
    history -c
    rm -rf $HOME/.cache/* \
           $HOME/.*history \
           $HOME/.*hst* \
           $HOME/.*bookmark* \
           $HOME/.*thumb* \
           $HOME/.rdesktop \
           $HOME/.pki \
           $HOME/.fltk \
           $HOME/.screenlayout
}

pgrep -x dmenu && exit

choice=$(echo "Shutdown\nReboot\nExit\nLock Screen" | dmenu -F -i -l 4 -p "Select Option:")

case "$choice" in
"Shutdown") ClearCache && /usr/bin/shutdown now ;;
"Reboot") ClearCache && /usr/bin/reboot ;;
"Exit") killall Xorg ;;
"Lock Screen") lockscreen.sh ;;
esac
