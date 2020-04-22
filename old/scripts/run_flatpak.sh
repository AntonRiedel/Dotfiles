#!/bin/sh
# File              : run_flatpak.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 06.04.2020
# Last Modified Date: 09.04.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

#display the name of all installed flatpaks and choose the one you wish to run
name=$(flatpak list | cut -f 1 | dmenu -i -F -l 5 -p "Run flatpak: "
)

#get the id of the associated flatpak
flatpak_id=$(flatpak list | grep "$name" | cut -f 2)

#run the flatpak
flatpak run $flatpak_id
