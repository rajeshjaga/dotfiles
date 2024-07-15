#!/bin/bash

if [ "$(which pactl 2>/dev/null)" ]; then 
    if [ $1 == "-d" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ -5%
    elif [ $1 == "-u" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
    elif [ $1 == "-m" ]; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
    else
        dunstify "unknown function"
    fi
elif [ "$(which pactl 2>/dev/null)" ]; then
    dunstify "pactl is not available, re-try install pactl"
fi
