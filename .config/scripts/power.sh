#/bin/bash

power_response=""

case $XDG_SESSION_TYPE in
    "wayland")
    power_response=$(printf  "ShutDown\nReboot\nLogout\nLock\nCancel" | rofi -dmenu -p "Choose a power option : ")
    ;;
    *)
    power_response=$(printf  "ShutDown\nReboot\nLogout\nLock\nCancel" | rofi -dmenu -p "Choose a power option : ")
    ;;
esac

case $power_response in
    "ShutDown")
        notify-send "Shutting Down in 4s.."
        sleep 4
        systemctl poweroff
        ;;
    "Reboot")
        notify-send "Restarting the machine in 4s."
        sleep 4
        systemctl reboot
        ;;
    "Lock")
        notify-send "Lock the session" 
        sleep 1
        systemctl suspend && betterlockscreen -l
        ;;
    "Logout")
        notify-send "Killing the current session in 4s"
        sleep 4
        ;;
esac
