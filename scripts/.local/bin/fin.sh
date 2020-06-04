#!/bin/sh
# File              : fin.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 01.06.2020
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
           $HOME/.jupyter \
           $HOME/.ipython \
           $HOME/.clangd \
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

exit 0
