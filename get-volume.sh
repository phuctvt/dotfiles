#!/usr/bin/bash

if [ $(pulsemixer --get-mute) = 0 ]; then
	echo ""
else
	pulsemixer --get-volume | awk '{print " " $1}'
fi
