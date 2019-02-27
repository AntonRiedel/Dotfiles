#! /bin/bash
###############################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2019-02-27 20:25]
#     Description         :     Start Xorg
###############################################################################

#set keyboard
if [ "$(cat /etc/hostname)" == "Mars" ];then
    setxkbmap gb
else
    setxkbmap de
fi

#make capslock useful
setxkbmap -option caps:escape

#prevent screen from blanking
setterm -blank 0 -powersave off -powerdown 0

#start Window Manager
exec i3
