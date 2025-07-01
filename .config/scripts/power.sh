#/bin/bash

poweropts="ShutDown\nReboot\nLogout\nLockScreen\nCancel"
power_response=$(printf  "ShutDown\nReboot\nLogout\nLock\nCancel" | rofi -dmenu -p "Choose a power option : ")

case $power_response in
    "ShutDown")
        dunstify "Power" "Shutting Down in 4s.."
        sleep 4
        systemctl poweroff
        ;;
    "Reboot")
        dunstify "Power" "Restarting the machine in 4s.." --icon=system-reboot
        sleep 4
        systemctl reboot
        ;;
    "Lock")
        dunstify "Power" "Lock the session" 
        sleep 1
        systemctl suspend && betterlockscreen -l
        ;;
    "Logout")
        dunstify "Power" "Killing the current session in 4s"
        sleep 4
        ;;
esac
