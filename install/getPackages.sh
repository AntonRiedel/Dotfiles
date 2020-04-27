#!/bin/sh
# File              : getPackages.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 25.03.2020
# Last Modified Date: 25.03.2020
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

pacman -Qeq > packages.install

flatpak list --app | cut -f 2 > flatpaks.install

