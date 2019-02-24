#! /bin/bash
#################################################################################
#     File Name           :     .xinitrc
#     Created By          :     Anton Riedel <anton.riedel@hotmail.com>
#     Creation Date       :     [2019-02-23 19:39]
#     Last Modified       :     [2019-02-24 11:54]
#     Description         :     Start Xorg
#################################################################################

#set keyboard
if [ "$(cat /etc/hostname)" == "Mars" ];then
    setxkbmap gb
else
    setxkbmap de
fi

#make capslock useful
setxkbmap -option caps:escape

#start Window Manager
exec i3
