#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers/"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    rofi -e "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Select a wallpaper using rofi
selected_wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | rofi -dmenu -p "Select Wallpaper")

# If a wallpaper is selected, set it as the background
if [ -n "$selected_wallpaper" ]; then
    swww img "$selected_wallpaper"
fi