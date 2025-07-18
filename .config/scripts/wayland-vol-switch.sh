#!/bin/bash
sources=$(pactl list short sinks | tr "\t" ";" | cut -d ";" -f 2 | wofi --show dmenu | xargs echo)


