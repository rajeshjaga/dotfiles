#!/bin/bash
# check if wally folder exists else pulls this stash wallpaper
# if the folder exists then change the wallpaper randomly
wallpaper_path="$HOME/.local/asset/wallpaper"
local_path="$HOME/Pictures/wally"
fehbg="$HOME/.fehbg"
fileName="wall_144.png"
background_link="https://raw.githubusercontent.com/rajeshjaga/wally/master/"

setWallpaper(){
    if [ -e "$wallpaper_path/$fileName" ];then
        feh --bg-scale "$wallpaper_path/$fileName" --no-fehbg
        echo "wallpaper has been set using feh!"
    elif [ "$PWD" == "$wallpaper_path" ];then
        if [ -n "$(which wget 2> /dev/null)" ]; then
            wget "$background_link/$fileName" 2> /dev/null
            feh --bg-scale "$wallpaper_path/$fileName" --no-fehbg
        elif [ -n "$(which curl 2> /dev/null)" ]; then
            curl -O  "$background_link/$fileName" 2> /dev/null
            feh --bg-scale "$wallpaper_path/$fileName" --no-fehbg
        fi
    else
        echo "suit yourself a good wallpaper"
    fi
}

setLocalWallpaper(){
    feh --bg-scale --randomize $local_path/* --no-fehbg
}

if [ -e "$fehbg" ]; then
    $fehbg
    echo "reached feh exited"
elif [ -d "$local_path" ]; then
    setLocalWallpaper
elif [ -d "$wallpaper_path" ]; then
    setWallpaper
elif [ ! -d "$wallpaper_path" ]; then
    mkdir -p "$wallpaper_path"
    cd "$wallpaper_path" || exit
    echo "reached path"
    setWallpaper
else
    echo "find yourself a good wallpaper"
fi
