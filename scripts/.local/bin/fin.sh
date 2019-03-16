#! /bin/bash
#################################################################################
#     File Name           :     fin.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:42]
#     Last Modified       :     [2019-03-16 17:04]
#     Description         :     Shutdown, reboot or kill current i3 instance
#################################################################################

ClearCache() {
    rm -rf $HOME/.cache/*
}

pgrep -x dmenu && exit

choice=$(echo -e "Shutdown\nReboot\nExit i3\nLock Screen" | dmenu -i -p "Select Option")

case "$choice" in
Shutdown) ClearCache && shutdown now ;;
Reboot) ClearCache && reboot ;;
"Exit i3") i3-msg exit ;;
"Lock Screen") lockscreen.sh ;;
esac
