#! /bin/sh
#################################################################################
#     File Name           :     screen.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:30]
#     Last Modified       :     [2019-06-02 17:08]
#     Description         :     Handle desktop setup
#################################################################################

pgrep -x dmenu && exit

screen=$HOME/.screenlayout
choice=$(ls $screen | dmenu -i -p "Where are you?")
$screen/$choice
xwallpaper --stretch $HOME/.config/wallpaper/default
