local awful = require("awful")

local A={}

A.wallpaper = "~/dotfiles/.config/scripts/wall.sh"
A.compositor = "picom -f -i -m=1.0 -r 0 -c -i 0.7 -l 0 -t 0 -b"
A.volicon = "~/dotfiles/.config/scripts/volume.sh"
A.network = "nm-applet &"
A.screenshot= "flameshot &"
A.sessionmanager = "lxsession &"
A.notification = "dunst -c ~/.config/dunst/dunstrc &"
A.monitor= "xrandr --refresh 60"

for _, i in pairs(A) do
    awful.spawn.with_shell(i)
end

