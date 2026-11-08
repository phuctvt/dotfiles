options="HiFi: Speaker: sink|HiFi: HDMI1: sink"

chosen="$(echo -e "$options" | \
    rofi -sep '|' -dmenu -p "Audio output" -location 3 -yoffset 40 -l 2 \
    -hover-select -theme gruvbox-dark-soft \
    -theme-str 'window { width: 300px; }' \
    -me-select-entry '' -me-accept-entry 'MousePrimary')"

case "$chosen" in
    "HiFi: Speaker: sink")
        pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink
        ;;
    "HiFi: HDMI1: sink")
        pactl set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__HDMI1__sink
        ;;
esac
