#!/bin/sh
# File              : fin.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 26.01.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

ClearCache() {
    rm -rf \
        $HOME/.cache/* \
        $HOME/.*history \
        $HOME/.*hst* \
        $HOME/.*bookmark* \
        $HOME/.*thumb* \
        $HOME/.rdesktop \
        $HOME/.var \
        $HOME/.pki \
        $HOME/.fltk \
        $HOME/.jupyter \
        $HOME/.ipython \
        $HOME/.clangd \
        $HOME/.cgdb \
        $HOME/.dbus \
        $HOME/.root* \
        $HOME/.ansible \
        $HOME/.android \
        $HOME/.screenlayout
}

pgrep -x dmenu && exit 1

choice=$(echo "Shutdown\nReboot\nExit\nLock Screen" | dmenu -F -i -l 4 -p "Select Option:")

case "$choice" in
"Shutdown") ClearCache && sudo /usr/bin/shutdown now ;;
"Reboot") ClearCache && sudo /usr/bin/reboot ;;
"Exit") killall Xorg ;;
"Lock Screen") lockscreen.sh ;;
esac

exit 0
