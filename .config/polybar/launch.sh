#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# killall polybar
# Otherwise you can use the nuclear option:
polybar-msg cmd quit
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log 
polybar mybar 2>&1 | tee -a /tmp/polybar1.log & disown
polybar secbar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
