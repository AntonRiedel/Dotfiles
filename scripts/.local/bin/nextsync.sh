#!/bin/sh
# File              : nextsync.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 06.03.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#bail out if nextcloud is running
pgrep nextcloud >/dev/null && exit 1

#credentials
User="anton"
Password="$(pass diamond/nextcloud/anton | head -n 1)"
Dir="$HOME/nextcloud"
Server="https://nextcloud.gemstones.strangled.net"

#make sure the directory exists; necessary when running for the first time after a reinstall
mkdir -p $Dir

#sync files
# nextcloudcmd -s --user "$User" --password "$Password" --exclude "$HOME/.config/Nextcloud/sync-exclude.lst" "$Dir" "$Server"
nextcloudcmd --user "$User" --password "$Password" --exclude "$HOME/.config/Nextcloud/sync-exclude.lst" "$Dir" "$Server"

exit 0
