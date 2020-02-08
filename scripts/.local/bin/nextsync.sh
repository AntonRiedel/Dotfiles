#! /bin/sh
###############################################################################
#     File Name           :     sync.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2020-01-04 00:20]
#     Last Modified       :     [2020-02-03 14:54]
#     Description         :      
###############################################################################

#credentials
user="anton"
password="$(pass neptune/nextcloud/admin)"
dir="$HOME/nextcloud"
server="https://mylittleserver.ddns.net"

#sync files
nextcloudcmd --user $user --password $password $dir $server
