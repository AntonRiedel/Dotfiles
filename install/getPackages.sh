#! /bin/sh
###############################################################################
#     File Name           :     getPackages.sh
#     Created By          :     Anton Riedel <anton.riedel@tum.de>
#     Creation Date       :     [2020-01-31 21:14]
#     Last Modified       :     [2020-03-02 21:42]
#     Description         :      
###############################################################################

pacman -Qeq > packages.install
