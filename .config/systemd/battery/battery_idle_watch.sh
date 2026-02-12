#!/bin/bash


while true; do
    bat_level=$(cat /sys/class/power_supply/BAT0/capacity)
    if [[ -n "$bat_level" ]]; then
        if (( $bat_level < 20 )); then
            notify-send "$bat_level"
        fi
    fi
    sleep 60
done
