#/bin/bash

POWEROPTS="ShutDown\nReboot\nLogout"
POWER_RESPONSE=$(printf $POWEROPTS | rofi -dmenu -p "Choose a power option : ")

