#!/usr/bin/env bash

if lsblk | grep -q $1; then
    df -h $1
else
    echo "space unavailable for $1"
fi
