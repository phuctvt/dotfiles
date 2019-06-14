#!/usr/bin/bash

#if [ -r "$HOME/.dbus/Xdbus" ]; then
#  . "$HOME/.dbus/Xdbus"
#fi

sleep 7
H=$(date +%H)
if (( 6 < 10#$H && 10#$H < 18  )); then
	echo '6am < now < 6pm'
	if [ $(cat $HOME/.kde-current-look) = 'dark' ]; then
    	$HOME/dotfiles/kde/pre-light.sh
    	echo 'light' > $HOME/.kde-current-look
    else
    	notify-send 'Already in light looking'
    fi
else
	echo '6pm < now < 6am'
	if [ $(cat $HOME/.kde-current-look) = 'light' ]; then
    	$HOME/dotfiles/kde/pre-dark.sh
    	echo 'dark' > $HOME/.kde-current-look
    else
    	notify-send 'Already in dark looking'
    fi
fi