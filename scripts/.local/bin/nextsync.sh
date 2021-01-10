#!/bin/sh
# File              : nextsync.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 30.11.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#bail out if nextcloud is running
pgrep nextcloud >/dev/null && exit 1

#credentials
User="anton"
Password="$(pass sun/nextcloud/anton)"
Dir="$HOME/nextcloud"
#server="https://mylittleserver.ddns.net"
Server="https://sgrastar.strangled.net/nextcloud"

mkdir -p $Dir

#sync files
nextcloudcmd --user $User --password $Password --exclude $HOME/.config/Nextcloud/sync-exclude.lst $Dir $Server

exit 0
