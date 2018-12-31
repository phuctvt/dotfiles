#!/usr/bin/bash

if [ $(pulsemixer --get-mute) = 1 ]; then
	echo ""
else
	pulsemixer --get-volume | awk '{print " " $1}'
fi
