#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 01.08.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit 1

#choose a layout with dmenu
layout=$(find $HOME/.screenlayout -type f -name "*.sh" | xargs -I{} basename {} | dmenu -i -p "Where are you?")

#set the layout
$HOME/.screenlayout/$layout

#clean up
xset -dpms
xset s off
xset r rate 300 50
xwallpaper --stretch $WALLPAPER

exit 0
