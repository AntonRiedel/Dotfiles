#! /bin/sh
#################################################################################
#     File Name           :     lockscreen.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2019-02-23 19:43]
#     Last Modified       :     [2020-03-02 21:50]
#     Description         :     Lock screen and display a distorted screenshot
#                               of the desktop
#################################################################################

rm -f /tmp/*.png

# If `imagemagick` is not installed, use a blank screen.
[ -f /usr/bin/convert ] &&
    scrot -m -z  /tmp/screen.png &&
    convert /tmp/screen.png -blur 0x8 -swirl 120 /tmp/locked.png

i3lock -e -f -c 000000 -i /tmp/locked.png

rm /tmp/*.png
