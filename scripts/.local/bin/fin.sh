#! /bin/sh
#################################################################################
#     File Name           :     fin.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:42]
#     Last Modified       :     [2020-01-14 20:37]
#     Description         :     Shutdown, reboot or kill current i3 instance
#################################################################################

ClearCache() {
    history -c
    rm -rf $HOME/.cache/* $HOME/.*history $HOME/.*hst $HOME/.*bookmark* $HOME/.*thumb* $HOME/.rdesktop $HOME/.pki $HOME/.fltk
}

pgrep -x dmenu && exit

choice=$(echo "Shutdown\nReboot\nExit\nLock Screen" | dmenu -i -p "Select Option")

case "$choice" in
Shutdown) ClearCache && /usr/bin/shutdown now ;;
Reboot) ClearCache && /usr/bin/reboot ;;
"Exit") kill $(ps -e | grep Xorg | awk '{print $1}') ;;
"Lock Screen") lockscreen.sh ;;
esac
