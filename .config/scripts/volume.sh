#!/bin/bash

if [ "$(which pactl 2>/dev/null)" ]; then 
    if [ $1 == "-d" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ -2%
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | cut -d "/" -f 2 | tr " " "/" | cut -d "/" -f 3)
        dunstify -h string:x-canonical-private-synchronous:audio "Volume: $vol" -h int:value:$vol --timeout=700

    elif [ $1 == "-u" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +2%
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | cut -d "/" -f 2 | tr " " "/" | cut -d "/" -f 3)
        dunstify -h string:x-canonical-private-synchronous:audio "Volume: $vol" -h int:value:$vol --timeout=700
    elif [ $1 == "-m" ]; then
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        mutstat=$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d " " -f 2)
        case $mutstat in
            "no")
                dunstify -h string:x-canonical-private-synchronous:audio "Volume: Unmuted" --timeout=1000
                ;;
            "yes")
                dunstify -h string:x-canonical-private-synchronous:audio "Volume: Muted" --timeout=1000
                ;;
        esac

    else
        dunstify "unknown function"
    fi
elif [ "$(which pactl 2>/dev/null)" ]; then
    dunstify "pactl is not available, re-try install pactl"
fi
