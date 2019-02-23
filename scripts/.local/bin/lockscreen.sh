#! /bin/bash
#################################################################################
#     File Name           :     lockscreen.sh
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:43]
#     Last Modified       :     [2019-02-23 19:45]
#     Description         :     Lock screen and display a distorted screenshot
#                               of the desktop
#################################################################################

rm -f /tmp/locked.png

# If `imagemagick` is not installed, use a blank screen.
[ -f /usr/bin/convert ] &&
    scrot -m -z /tmp/base.png &&
    convert /tmp/base.png -blur 0x8 -swirl 60 /tmp/locked.png

i3lock -e -f -c 000000 -i /tmp/locked.png
