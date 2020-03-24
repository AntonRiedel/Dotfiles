#!/bin/sh
# File              : screen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pgrep -x dmenu && exit

screen=$HOME/.config/screenlayout
choice=$(ls $screen | dmenu -i -p "Where are you?")
$screen/$choice
xwallpaper --stretch $HOME/.config/wallpaper/default

