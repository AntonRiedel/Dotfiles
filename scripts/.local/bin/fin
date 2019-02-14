#!/bin/bash

#This script will either shutdown, reboot, kill the current i3 instance or lock the screen.
#The script will open a dmenu prompt and ask for your choice.

ClearCache() {
    rm -rf $HOME/.cache/*
}

pgrep -x dmenu && exit

choice=$(echo -e "Shutdown\nReboot\nExit i3\nLock Screen" | dmenu -i -p "Select Option")

case "$choice" in
Shutdown) ClearCache && shutdown now ;;
Reboot) ClearCache && reboot ;;
"Exit i3") i3-msg exit ;;
"Lock Screen") lockscreen ;;
esac
