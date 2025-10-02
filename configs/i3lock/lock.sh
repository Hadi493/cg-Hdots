#!/bin/bash

# Dark Theme i3lock Configuration
# This script provides a modern, dark themed lock screen

# Colors (Dark Theme)
BACKGROUND="#1e1e2e"       # Dark background
CLEAR="#313244"            # Clear color
DEFAULT="#cdd6f4"          # Default text color
TEXT="#f38ba8"             # Text input color
WRONG="#f38ba8"            # Wrong password color
VERIFYING="#a6e3a1"        # Verifying color
RING="#89b4fa"             # Ring color
INSIDE="#313244"           # Inside ring color
LINE="#6c7086"             # Line color
SEPARATOR="#6c7086"        # Separator color

# Ring colors for different states
RING_WRONG="#f38ba8"       # Ring when password is wrong
RING_CLEAR="#313244"       # Ring when cleared
RING_VER="#a6e3a1"         # Ring when verifying

# Inside colors for different states
INSIDE_WRONG="#45475a"     # Inside when password is wrong
INSIDE_CLEAR="#313244"     # Inside when cleared
INSIDE_VER="#313244"       # Inside when verifying

# Create a temporary background if none exists
TEMP_BG="/tmp/i3lock_bg.png"

# Check if we have imagemagick for better backgrounds
if command -v convert >/dev/null 2>&1; then
    # Create a gradient dark background
    convert -size 1920x1080 gradient:"#1e1e2e-#313244" "$TEMP_BG" 2>/dev/null || {
        # Fallback: create solid color background
        convert -size 1920x1080 xc:"$BACKGROUND" "$TEMP_BG" 2>/dev/null
    }
fi

# i3lock command with dark theme
LOCK_CMD="i3lock \
--nofork \
--ignore-empty-password \
--show-failed-attempts \
--image=$TEMP_BG \
--tiling \
--color=$BACKGROUND \
--insidevercolor=$INSIDE_VER \
--ringvercolor=$RING_VER \
--insidewrongcolor=$INSIDE_WRONG \
--ringwrongcolor=$RING_WRONG \
--insidecolor=$INSIDE \
--ringcolor=$RING \
--linecolor=$LINE \
--separatorcolor=$SEPARATOR \
--verifcolor=$VERIFYING \
--wrongcolor=$WRONG \
--timecolor=$DEFAULT \
--datecolor=$DEFAULT \
--layoutcolor=$DEFAULT \
--keyhlcolor=$TEXT \
--bshlcolor=$WRONG \
--screen=0 \
--blur=5 \
--clock \
--indicator \
--timestr='%H:%M:%S' \
--datestr='%A, %B %d, %Y' \
--keylayout=0 \
--radius=120 \
--ring-width=8 \
--inside-ring-width=4 \
--time-font='JetBrains Mono' \
--date-font='JetBrains Mono' \
--layout-font='JetBrains Mono' \
--verif-font='JetBrains Mono' \
--wrong-font='JetBrains Mono' \
--time-size=28 \
--date-size=16 \
--layout-size=14 \
--verif-size=16 \
--wrong-size=16"

# Execute the lock command
eval $LOCK_CMD

# Clean up temporary files
[ -f "$TEMP_BG" ] && rm -f "$TEMP_BG"
