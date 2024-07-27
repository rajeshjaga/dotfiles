#/bin/bash

exitopts="Exit i3|Nope!"
exitresponse=$(echo "$exitopts" | rofi -sep "|" -dmenu -p "Choose a option : ")
<<<<<<< Updated upstream
activesession=$(loginctl list-sessions | grep active | awk '{print $1}')
=======
activesession="$(loginctl list-sessions | grep active | awk '{print $1}')"
>>>>>>> Stashed changes

if [ "$exitresponse" != "Nope!" ]; then
    dunstify "Exiting i3.. in 4s"
    sleep 4
<<<<<<< Updated upstream
    loginctl kill-session "$activesession"
=======
    loginctl kill-session $activesession 
>>>>>>> Stashed changes
    i3-msg exit
else
    dunstify "Not doing anything"
fi
