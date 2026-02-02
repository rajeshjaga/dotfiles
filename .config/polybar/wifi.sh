#/usr/env /bin/bash

if [ -f $(which iwd 2> /dev/null) ]; then
    ssid_name=$(iwctl station wlan0 show | grep "Connected network" | xargs echo | cut -d " " -f 3)
    echo $ssid_name
fi
