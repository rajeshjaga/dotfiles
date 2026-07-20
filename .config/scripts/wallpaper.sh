#!/usr/bin/env bash

choosenfile="/home/$USER/Pictures/wall"
if command -v ranger &>/dev/null ; then
    ranger --choosefile=$choosenfile
fi

if command -v swaybg&>/dev/null; then
    if [ len($choosenfile) > 0 ];  then
        swaybg -i $( cat $choosenfile )
        wal -i $( cat $choosenfile )
    else
    fi
fi

