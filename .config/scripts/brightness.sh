#!/bin/bash
#
#
id=13

if [[ -f "$(which brillo)"  ]]; then
    if [[ $1 == "up" ]]; then
        # brillo -q -A 5
        brillo -A 5
        bri=$(brillo)
        dunstify --hints=int:value:"$bri" $bri
        echo "up $bri"
    elif [[ $1 == "down" ]]; then
        # brillo -q -U 5
        brillo -U 5
        bri=$(brillo)
        dunstify --hints=int:value:"$bri" $bri 
        echo "up $bri"
    fi
else
    dunstify "Hint" "Check if brillo is installed"
fi
