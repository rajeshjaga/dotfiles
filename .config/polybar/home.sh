#/usr/bin/env /bin/bash

if lsblk | grep $1; then
    echo "home is new partition"
else
    echo "same as root"
fi
