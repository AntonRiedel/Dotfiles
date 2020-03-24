#!/bin/sh
# File              : nextsync.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 24.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#credentials
user="anton"
password="$(pass neptune/nextcloud/admin)"
dir="$HOME/nextcloud"
server="https://mylittleserver.ddns.net"

#sync files
nextcloudcmd --user $user --password $password $dir $server
