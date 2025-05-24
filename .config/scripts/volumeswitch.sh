#/bin/bash
pactl list short sink-inputs | cut -f1 | while read stream; do pactl move-sink-input $stream [sink_name]; done
