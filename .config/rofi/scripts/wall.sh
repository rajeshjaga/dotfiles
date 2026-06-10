#!/usr/bin/env bash

get_wallpaper_files(){
    local dir=$(ls $HOME/Pictures/wally/)
    declare -a files
     count=0

    for i in ; do
        count=count+1;
        echo $HOME/Pictures/wally/$i
    done
    echo $count
}

get_wallpaper_files 
