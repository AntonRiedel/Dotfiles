#!/bin/sh
# File              : nextsync.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 07.05.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#credentials
User="anton"
Password="$(pass sun/nextcloud/anton)"
Dir="$HOME/nextcloud"
#server="https://mylittleserver.ddns.net"
Server="https://sgrastar.ddns.net/nextcloud"

mkdir -p $Dir

#sync files
nextcloudcmd --user $User --password $Password --exclude $HOME/.config/Nextcloud/sync-exclude.lst $Dir $Server

exit 0
