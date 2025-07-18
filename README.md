# Dotfiles
----
This is the config folder for my linux machine for window manager and more tools:
- awesomewm
- hyprland
- i3wm 
- polybar
- waybar
- alacritty
- kitty
- dunst
- fastfetch
- bashrc
- zsh config
- htop
- picom - blur and transparent
- qtile - intital config
- ranger
- sway
- wofi
- xmoand
- xmobar
- sxwm
- tmux
    ```bash
    Ctrl+S #modifier
    ```

```bash
git clone https://github.com/rajeshjaga/dotfiles ~/dotfiles/
cd ~/dotfiles
git checkout latest-2025-07
stow . --ignore=README.md # dont use adopt just delete the conflict files
```

Make sure to install below apps (maybe I'll write a script to install required pieces of software)
```bash
sudo pacman -S i3 i3status rofi nnn ranger nwg-look brillo ttf-fira-code ttf-roboto noto-fonts noto-fonts-emoji noto-fonts-extra rofi terminus-font kitty alacritty wezterm imagemagick feh imv wget curl jq stow luajit luarocks cmake ninja meson papirus-icon-theme python-pillow w3m zathura zathura-pdf-poppler thunar xdg-user-dirs hyprland hyprpaper waybar wofi lua-lgi neovim tmux fd ripgrep man man-db starship zsh
```
