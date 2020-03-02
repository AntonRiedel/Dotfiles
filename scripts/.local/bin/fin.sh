#! /bin/sh
#################################################################################
#     File Name           :     fin.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:42]
#     Last Modified       :     [2020-02-11 10:47]
#     Description         :     Shutdown, reboot or kill current i3 instance
#################################################################################

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
