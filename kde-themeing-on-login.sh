#!/usr/bin/bash

#if [ -r "$HOME/.dbus/Xdbus" ]; then
#  . "$HOME/.dbus/Xdbus"
#fi

sleep 7
H=$(date +%H)
if (( 6 < 10#$H && 10#$H < 18  )); then
    echo '6am < now < 6pm'
    ~/dotfiles/kde-pre-light.sh
else
    echo '6pm < now < 6am'
    ~/dotfiles/kde-pre-dark.sh
fi
