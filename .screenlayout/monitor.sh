#!/usr/bin/bash

if [ "$(xrandr | grep "^DP1 connected")" ]; then
    xrandr --output DP1 --primary --mode 1366x768 --output eDP1 --mode 1366x768 --right-of DP1
else
    xrandr --output eDP1 --primary --mode 1366x768 --output DP1 --off
fi
