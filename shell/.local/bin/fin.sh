#!/bin/sh
# File              : fin.sh
# Author            : Anton Riedel <anton.riedel@tum.de>
# Date              : 24.03.2020
# Last Modified Date: 22.07.2022
# Last Modified By  : Anton Riedel <anton.riedel@tum.de>

ClearCache() {
  rm -rf \
    $HOME/.cache/* \
    $HOME/.*history \
    $HOME/.*hst* \
    $HOME/.*hist* \
    $HOME/.*bookmark* \
    $HOME/.*thumb* \
    $HOME/.rdesktop \
    $HOME/.var \
    $HOME/.vnc \
    $HOME/.parallel \
    $HOME/.w3m \
    $HOME/.pki \
    $HOME/.fltk \
    $HOME/.jupyter \
    $HOME/.ipython \
    $HOME/.ipynb* \
    $HOME/.clangd \
    $HOME/.cgdb \
    $HOME/.texlive \
    $HOME/.dbus \
    $HOME/.ansible \
    $HOME/.android \
    $HOME/.root_*
}

pgrep -x dmenu && exit 1

choice=$(echo -e "Shutdown\nReboot\nExit\nLock Screen" | dmenu -i -l 4 -p "Select Option:")

case "$choice" in
"Shutdown") ClearCache && /usr/bin/shutdown now ;;
"Reboot") ClearCache && /usr/bin/reboot ;;
"Exit") killall Xorg ;;
"Lock Screen") lockscreen.sh ;;
esac

exit 0
