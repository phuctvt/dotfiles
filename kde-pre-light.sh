#!/usr/bin/bash

if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

konsole -e ~/dotfiles/kde-light.sh