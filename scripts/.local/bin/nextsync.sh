#! /bin/sh
###############################################################################
#     File Name           :     sync.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2020-01-04 00:20]
#     Last Modified       :     [2020-02-01 20:04]
#     Description         :      
###############################################################################

user="anton"
password="$(pass neptune/nextcloud/admin)"
dir="$HOME/nextcloud"
server="https://mylittleserver.ddns.net"

notify-send "Starting syncing files to nextcloud"

nextcloudcmd --logwindow --user $user --password $password $dir $server 

notify-send "Sync complete"
