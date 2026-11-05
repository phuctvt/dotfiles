#!/bin/sh

if xrandr | grep -q "DP-2 connected"; then
    xrandr \
      --output eDP-1 --mode 1920x1080 --pos 2560x282 --rotate normal \
      --output DP-2 --primary --mode 2560x1440 --pos 0x0 --rotate normal --left-of eDP-1
    
    xdotool mousemove 1282 750
else
    xrandr --output eDP-1 --auto --primary
fi
