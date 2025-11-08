#/bin/bash

exitopts="Exit i3|Nope!"
exitresponse=$(echo "$exitopts" | rofi -sep "|" -dmenu -p "Choose a option : ")
activesession="$(loginctl list-sessions | grep active | awk '{print $1}')"

case $exitresponse in
    "Exit i3")
        notify-send -u critical -t 300 -i /usr/share/icons/Papirus-Dark/64x64/apps/system-shutdown.svg help       
        sleep 4
        loginctl kill-session $activesession 
        i3-msg exit
        ;;
    "NOPE!")
        dunstify "Mind your business here"
        ;;
    *)
        dunstify "Mind your business here"
        ;;
esac

# if [ "$exitresponse" != "Nope!" ]; then
#     dunstify "Exiting i3.. in 4s"
#     sleep 4
#     loginctl kill-session $activesession 
#     i3-msg exit
# else
#     dunstify "Not doing anything"
# fi
