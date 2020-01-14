#! /bin/sh
#################################################################################
#     File Name           :     screen.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:30]
#     Last Modified       :     [2020-01-14 20:29]
#     Description         :     Handle desktop setup
#################################################################################

pgrep -x dmenu && exit

screen=$HOME/.config/screenlayout
choice=$(ls $screen | dmenu -i -p "Where are you?")
$screen/$choice
xwallpaper --stretch $HOME/.config/wallpaper/default

