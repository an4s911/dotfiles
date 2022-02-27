#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-main.log /tmp/polybar-mon2.log
polybar main 2>&1 | tee -a /tmp/polybar-main.log & disown
polybar mon2 2>&1 | tee -a /tmp/polybar-mon2.log & disown

echo "Bars launched..."
