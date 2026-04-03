#!/usr/bin/env bash

if command -v playerctl &> /dev/null; then
    if [ $1 == "play-pause" ]; then
        playerctl --player=%any, play-pause
        notify-send "Player" "$(playerctl metadata --format '{{playerName}} - {{title}}')"
    elif [ $1 == "next" ]; then
        playerctl --player=%any, next
        sleep 2
        notify-send "Player" "$(playerctl metadata --format '{{playerName}} - {{title}}')"
    elif [ $1 == "prev" ]; then
        playerctl --player=%any, previous
        sleep 2
        notify-send "Player" "$(playerctl metadata --format '{{playerName}} - {{title}}')"
    elif [ $1 == "stop" ]; then
        playerctl --player=%any, stop
        sleep 2
        notify-send "Player" "$(playerctl metadata --format '{{playerName}} - {{title}}')"
    fi
else
    notify-send "Player" "Couldnt find the playerctl"
fi
