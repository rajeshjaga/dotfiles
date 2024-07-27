#!/bin/bash

nwg-look -a &
flameshot &
picom --config $HOME/dotfiles/.config/picom/picom.conf &
lxsession --session=dwm --de=dwm & 
blueman-applet &
xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 119.98 --right-of eDP1 &
$HOME/dotfiles/.config/scripts/wall.sh &
dunst -c $HOME/dotfiles/.config/dunst/dunstrc &
nm-applet &
slstatus &
