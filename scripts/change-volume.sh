#!/usr/bin/bash

if [ "$1" = "up" ]; then
	pulsemixer --change-volume +1
	# play ~/dotfiles/scripts/Blooper-sound-effect.wav
elif [ "$1" = "down" ]; then
	pulsemixer --change-volume -1
	# play ~/dotfiles/scripts/Blooper-sound-effect.wav
elif [ "$1" = "toggle-mute" ]; then
	pulsemixer --toggle-mute
fi
