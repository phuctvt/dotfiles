#!/bin/sh

touch $HOME/.dbus/Xdbus
chmod 600 $HOME/.dbus/Xdbus
env | grep DBUS_SESSION_BUS_ADDRESS > $HOME/.dbus/Xdbus
env | grep -P "^PATH" >> $HOME/.dbus/Xdbus
echo 'export DBUS_SESSION_BUS_ADDRESS' >> $HOME/.dbus/Xdbus
echo 'export PATH' >> $HOME/.dbus/Xdbus
echo 'export DISPLAY=:0' >> $HOME/.dbus/Xdbus

exit 0
