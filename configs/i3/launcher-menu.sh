#!/bin/bash

# Launcher Menu Script - Choose between different app launchers
# Uses rofi to select which launcher to use

CHOICE=$(echo -e "󰀻 Rofi (Primary)\n Fuzzel (Fast)\n󰖯 Wofi (Wayland)\n󰻞 Bemenu (Simple)\n💻 ulauncher (GUI)" | rofi -dmenu -i -p "Choose Launcher" -theme-str 'window {width: 400px; height: 300px;}')

case $CHOICE in
    "󰀻 Rofi (Primary)")
        rofi -show drun
        ;;
    " Fuzzel (Fast)")
        fuzzel
        ;;
    "󰖯 Wofi (Wayland)")
        wofi --show drun
        ;;
    "󰻞 Bemenu (Simple)")
        bemenu-run -p "Apps >" --fn "Iosevka Nerd Font Mono 14" \
                   --tb "#1e1e2e" --tf "#cdd6f4" --fb "#1e1e2e" --ff "#cdd6f4" \
                   --nb "#1e1e2e" --nf "#cdd6f4" --hb "#cba6f7" --hf "#11111b" \
                   --sb "#45475a" --sf "#cdd6f4" --scb "#cba6f7" --scf "#11111b"
        ;;
    "💻 ulauncher (GUI)")
        ulauncher-toggle
        ;;
    *)
        exit 1
        ;;
esac
