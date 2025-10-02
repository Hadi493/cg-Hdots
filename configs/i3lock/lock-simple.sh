#!/bin/bash

# Simple Dark Theme i3lock Configuration
# Compatible with both standard i3lock and i3lock-color

# Check if we have i3lock-color features
if i3lock --help 2>&1 | grep -q "inside-color"; then
    # Use i3lock-color with advanced options
    BACKGROUND="#1e1e2e"
    RING="#89b4fa"
    INSIDE="#313244"
    WRONG="#f38ba8"
    VERIFYING="#a6e3a1"
    TEXT="#cdd6f4"
    
    i3lock \
        --nofork \
        --ignore-empty-password \
        --show-failed-attempts \
        --color="$BACKGROUND" \
        --inside-color="$INSIDE" \
        --ring-color="$RING" \
        --insidever-color="$INSIDE" \
        --ringver-color="$VERIFYING" \
        --insidewrong-color="$INSIDE" \
        --ringwrong-color="$WRONG" \
        --line-color="$INSIDE" \
        --separator-color="$INSIDE" \
        --verif-color="$VERIFYING" \
        --wrong-color="$WRONG" \
        --time-color="$TEXT" \
        --date-color="$TEXT" \
        --layout-color="$TEXT" \
        --keyhl-color="$WRONG" \
        --bshl-color="$WRONG" \
        --indicator \
        --clock
else
    # Fallback to basic i3lock
    BACKGROUND="1e1e2e"  # Remove # for basic i3lock
    
    i3lock \
        --nofork \
        --ignore-empty-password \
        --color="$BACKGROUND"
fi
