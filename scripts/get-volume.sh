#!/usr/bin/bash

# https://bbs.archlinux.org/viewtopic.php?id=227521
# https://unix.stackexchange.com/questions/25776/detecting-headphone-connection-disconnection-in-linux

x=$(pacmd list-cards | grep -P "analog-output-headphones.+?available" | awk -F ":" '{print $3}')
speaker_icon=""
if [ "$x" = " yes)" ]; then
	speaker_icon=""
fi

if [ $(pulsemixer --get-mute) = 1 ]; then
	echo ""
else
	echo -n "$speaker_icon"
	pulsemixer --get-volume | awk '{print " " $1}'
fi
