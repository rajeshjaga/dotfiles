#/bin/bash

if [ "$(which pactl 2>/dev/null)" ]; then 
    if [ "$($1 == "-d" ]; then
        "$(pactl set-sink-volume @DEFAULT_SINK@ -5%)"
        "

elif [ "$(which pactl 2>/dev/null)" ]; then
    
fi
