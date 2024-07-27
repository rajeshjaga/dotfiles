#!/bin/bash

nwg-look -a &
# ~/.fehbg & 
dwmstatus &
flameshot &
picom -f -i -m=1.0 -r 0 -c -i 0.97 -l 0 -t 0 -b
lxsession --session=dwm --de=dwm & 
blueman-applet &
xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 119.98 --right-of eDP1
nitrogen --restore &
# $HOME/dotfiles/.config/scripts/wall.sh
dunst -c ~/.config/dunst/dunstrc
nm-applet &

