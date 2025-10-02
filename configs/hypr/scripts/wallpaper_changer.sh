#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers/collection-2/"

# WALLPAPER_DIR="$HOME/Pictures/wallpapers/nature-collections/"

# WALLPAPER_DIR="$HOME/Pictures/wallpapers/cg-wallpapers/"

# Start daemon if not running
if ! pgrep -x swww-daemon >/dev/null; then
    swww-daemon --format xrgb &
    sleep 0.5
fi

# Pick a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n1)

# Set wallpaper with transition
swww img "$WALLPAPER" \
  --transition-type any \
  --transition-fps 30 \
  --transition-duration 1

# TOOLS:
# - sudo pacman -S swww
