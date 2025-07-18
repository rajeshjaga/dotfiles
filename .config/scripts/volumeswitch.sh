#/bin/bash
#pactl list short sink-inputs | cut -f1 | while read stream; do pactl move-sink-input $stream [sink_name]; done

selected_op="x11"

case $XDG_SESSION_TYPE in
    "wayland")
    selected_op=$(printf "Headphone\nSpeakers" | wofi --show dmenu | xargs echo)
    ;;
    *)
    selected_op=$(printf "Headphone\nSpeakers" | rofi -show dmenu | xargs echo)
    ;;
    esac

speaker(){
     pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink
    notify-send --icon=speaker "Default Sink switched to speaker or $(pactl get-default-sink)" --expire-time=700
}

headphone(){
    pactl set-default-sink alsa_output.usb-Synaptics_VENTURE-DAS-32-00.analog-stereo
    notify-send --icon=headphone "Default Sink switched to headphone or $(pactl get-default-sink)" --expire-time=700
}

case $selected_op in
    "Headphone")
        headphone
        ;;
    "Speakers")
        speaker
        ;;
    *)
        $(notify-send "You shouldn't have reached here")
        ;;
esac

