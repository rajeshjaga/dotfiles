local awful = require("awful")

local A = {}

--A.wallpaper = "~/dotfiles/.config/scripts/wall.sh"
A.wallpaper = "nitrogen --restore"
A.compositor = "picom --config ~/dotfiles/.config/picom/picom.conf"
--A.volicon = "~/dotfiles/.config/scripts/volume.sh"
A.network = "nm-applet"
A.screenshot = "flameshot &"
A.sessionmanager = "lxsession &"
A.firewallapplet = "killall firewall-applet &"
A.notification = "dunst -c ~/.config/dunst/dunstrc --startup-notification"
A.screensaver = "xscreensaver --no-splash &"
A.extMonitor = "xrandr --output HDMI-1-0 --mode 1920x1080 --refresh 119.98 --right-of eDP1"

for _, i in pairs(A) do
    awful.spawn.with_shell(i)
end
