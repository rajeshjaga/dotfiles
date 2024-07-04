#!/bin/bash

nwg-look -a &
# ~/.fehbg & 
dwmstatus &
flameshot &
picom -f -i -m=1.0 -r 0 -c -i 0.7 -l 0 -t 0 -b
lxsession --session=dwm --de=dwm & 
blueman-applet &
$HOME/dotfiles/.config/scripts/wall.sh
dunst -c ~/.config/dunst/dunstrc
nm-applet &

