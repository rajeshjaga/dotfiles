#/bin/bash

exitopts="Exit i3|Nope!"
exitresponse=$(echo "$exitopts" | rofi -sep "|" -dmenu -p "Choose a option : ")
activesession=loginctl list-session | grep active | awk '{print $1}'

if [ "$exitresponse" != "Nope!" ]; then
    dunstify "Exiting i3.. in 4s"
    sleep 4
    loginctl kill-session $activesession && i3-msg exit
else
    dunstify "Not doing anything"
fi
