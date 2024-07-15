#!/bin/bash
pacman -S mtools dosfstools reflector intel-ucode

sudo pacman -Sy 
sudo pacman -Fy 
sudo pacman -S ninja meson xorg mesa xorg-server firefox lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings ttf-fira-code ttf-roboto  noto-fonts noto-fonts-emoji noto-fonts-extra rofi terminus-font kitty alacritty wezterm imagemagick feh imv wget curl jq stow luajit luarocks cmake ninja meson papirus-icon-theme ranger python-pillow w3m zathura zathura-pdf-poppler thunar xdg-user-dirs hyprland i3 hyprpaper waybar wofi lua-lgi tmux fd ripgrep man man-db
