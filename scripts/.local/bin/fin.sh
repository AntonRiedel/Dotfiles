#!/bin/sh
# File              : fin.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 09.09.2020
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
           $HOME/.root* \
           $HOME/.screenlayout
}

pgrep -x dmenu && exit

choice=$(echo "Shutdown\nReboot\nExit\nLock Screen" | dmenu -F -i -l 4 -p "Select Option:")

case "$choice" in
"Shutdown") ClearCache && sudo /usr/bin/poweroff ;;
"Reboot") ClearCache && sudo /usr/bin/reboot ;;
"Exit") killall Xorg ;;
"Lock Screen") lockscreen.sh ;;
esac

exit 0
