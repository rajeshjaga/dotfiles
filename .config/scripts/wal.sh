#/bin/bash
if [ 
wal -i $(cat .fehbg | tail -n 1|cut -d " " -f 4 | tr "'" " ")
