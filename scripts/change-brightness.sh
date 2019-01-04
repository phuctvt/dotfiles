#!/usr/bin/bash

if [ "$1" = "up" ]; then
	xbacklight +3
elif [ "$1" = "down" ]; then
	xbacklight -3
fi
