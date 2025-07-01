#!/bin/bash

if [ $(which wal>2/dev/null) ]; then
    wal -i $(cat $HOME/.fehbg | tail -n 1|cut -d " " -f 4 | tr "'" " ")
fi

