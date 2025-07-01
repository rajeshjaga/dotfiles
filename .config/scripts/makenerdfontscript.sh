#!/bin/bash

if [ ! $(sudo -n true 2>/dev/null) ]; then
    mkdir $HOME/.local/share/fonts
    cd $HOME/.local/share/fonts

    curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep JetBrainsMono.tar.xz | grep download_url | cut -d ":" -f 2,3 | xargs wget | mkdir JetBrainsMono && tar xvf JetBrainsMono.tar.xz --directory=JetBrainsMono --exclude="*.md" --exclude="OFL.txt"

    curl -fsSL https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep Iosevka.tar.xz | grep download_url | cut -d ":" -f 2,3 | xargs wget | mkdir Iosevka && tar xvf Iosevka.tar.xz --directory=Iosevka --exclude="*.md" --exclude="OFL.txt"

    sudo mkdir -p /usr/share/fonts/truetype/NerdFonts
    sudo mkdir -p /usr/share/fonts/NerdFonts/{Iosevka,JetBrainsMono}

    sudo mv {Iosevka,JetBrainsMono} /usr/share/fonts/NerdFonts/
    rm -rf $HOME/.local/share/fonts/*
else
    notify-send "Help fonts script failed!"
    echo "Try re-running the script with root access"
fi
