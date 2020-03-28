#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 28.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit

layout=$(ls $HOME/.config/screenlayout | dmenu -F -i -p "Where are you?")

$HOME/.config/screenlayout/$layout

xwallpaper --stretch $HOME/.config/wallpaper/default

#keboard setup
setxkbmap us
setxkbmap -option caps:escape
