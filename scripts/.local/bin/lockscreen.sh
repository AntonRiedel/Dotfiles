#!/bin/sh
# File              : lockscreen.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 13.10.2020
# Last Modified Date: 28.02.2021
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#clean up before
rm -f /tmp/*png

#take a screenshot of the entire desktop and save it under /tmp
#it will be called 'something.png'
flameshot full -p /tmp

#wait for flameshot to take the screenshot
sleep 1

#find and rename the picture
find /tmp -type f -name "*png" -exec mv {} /tmp/screen.png \;

#blur and swirl the picture
convert /tmp/screen.png -blur 0x8 -swirl 120 /tmp/locked.png

#lock the screen
i3lock -i /tmp/locked.png

#clean up after
rm /tmp/locked.png /tmp/screen.png

exit 0
