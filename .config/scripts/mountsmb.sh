#!/bin/bash

ip='10.0.0.105'

if [ "ping $ip -c 1 2>/dev/null" ]; then 
    echo true
else
    echo false
fi
