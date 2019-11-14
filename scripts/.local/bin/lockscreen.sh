#! /bin/sh
#################################################################################
#     File Name           :     lockscreen.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:43]
#     Last Modified       :     [2019-07-04 15:57]
#     Description         :     Lock screen and display a distorted screenshot
#                               of the desktop
#################################################################################

rm -f /tmp/locked.png

# If `imagemagick` is not installed, use a blank screen.
[ -f /usr/bin/convert ] &&
    scrot -m -z /tmp/base.png &&
    convert /tmp/base.png -blur 0x8 -swirl 120 /tmp/locked.png

i3lock -e -f -c 000000 -i /tmp/locked.png

rm /tmp/locked.png
rm /tmp/base.png
