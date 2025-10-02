#!/bin/bash

# Advanced i3lock Dark Theme Script
# Reads configuration from theme.conf and provides advanced features

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
THEME_CONF="$SCRIPT_DIR/theme.conf"

# Load theme configuration if it exists
if [[ -f "$THEME_CONF" ]]; then
    source "$THEME_CONF"
else
    echo "Warning: theme.conf not found, using defaults"
    # Default fallback colors
    BACKGROUND="#1e1e2e"
    SURFACE="#313244"
    TEXT="#cdd6f4"
    ACCENT="#89b4fa"
    SUCCESS="#a6e3a1"
    ERROR="#f38ba8"
    MUTED="#6c7086"
    
    RING_DEFAULT="$ACCENT"
    RING_WRONG="$ERROR"
    RING_VERIFYING="$SUCCESS"
    INSIDE_DEFAULT="$SURFACE"
    INSIDE_WRONG="#45475a"
    INSIDE_VERIFYING="$SURFACE"
    
    TIME_COLOR="$TEXT"
    DATE_COLOR="$TEXT"
    VERIF_COLOR="$SUCCESS"
    WRONG_COLOR="$ERROR"
    KEYHL_COLOR="$ERROR"
    BSHL_COLOR="$ERROR"
    
    BLUR_LEVEL="5"
    RING_RADIUS="120"
    RING_WIDTH="8"
    FONT_FAMILY="JetBrains Mono"
    TIME_SIZE="28"
    DATE_SIZE="16"
    VERIF_SIZE="16"
    WRONG_SIZE="16"
    
    TIME_FORMAT="%H:%M:%S"
    DATE_FORMAT="%A, %B %d, %Y"
    SHOW_CLOCK="true"
    SHOW_INDICATOR="true"
    SHOW_FAILED_ATTEMPTS="true"
    
    USE_CUSTOM_BACKGROUND="false"
    GENERATE_GRADIENT="true"
    GRADIENT_START="$BACKGROUND"
    GRADIENT_END="$SURFACE"
fi

# Temporary background file
TEMP_BG="/tmp/i3lock_advanced_bg.png"

# Function to create background
create_background() {
    local screen_resolution
    screen_resolution=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | head -1)
    
    if [[ -z "$screen_resolution" ]]; then
        screen_resolution="1920x1080"
    fi
    
    if [[ "$USE_CUSTOM_BACKGROUND" == "true" && -f "$CUSTOM_BACKGROUND_PATH" ]]; then
        # Use custom background image
        convert "$CUSTOM_BACKGROUND_PATH" -resize "$screen_resolution^" -gravity center -crop "$screen_resolution+0+0" "$TEMP_BG" 2>/dev/null
    elif [[ "$GENERATE_GRADIENT" == "true" ]] && command -v convert >/dev/null 2>&1; then
        # Create gradient background
        convert -size "$screen_resolution" gradient:"$GRADIENT_START-$GRADIENT_END" "$TEMP_BG" 2>/dev/null
    else
        # Fallback: solid color background
        if command -v convert >/dev/null 2>&1; then
            convert -size "$screen_resolution" xc:"$BACKGROUND" "$TEMP_BG" 2>/dev/null
        fi
    fi
}

# Function to build i3lock command
build_lock_command() {
    local cmd="i3lock --nofork"
    
    # Basic options
    cmd+=" --ignore-empty-password"
    
    if [[ "$SHOW_FAILED_ATTEMPTS" == "true" ]]; then
        cmd+=" --show-failed-attempts"
    fi
    
    # Background
    if [[ -f "$TEMP_BG" ]]; then
        cmd+=" --image=\"$TEMP_BG\""
        if [[ "$BLUR_LEVEL" -gt 0 ]]; then
            cmd+=" --blur=$BLUR_LEVEL"
        fi
    else
        cmd+=" --color=\"$BACKGROUND\""
    fi
    
    # Colors
    cmd+=" --insidecolor=\"$INSIDE_DEFAULT\""
    cmd+=" --ringcolor=\"$RING_DEFAULT\""
    cmd+=" --insidevercolor=\"$INSIDE_VERIFYING\""
    cmd+=" --ringvercolor=\"$RING_VERIFYING\""
    cmd+=" --insidewrongcolor=\"$INSIDE_WRONG\""
    cmd+=" --ringwrongcolor=\"$RING_WRONG\""
    cmd+=" --linecolor=\"$MUTED\""
    cmd+=" --separatorcolor=\"$MUTED\""
    cmd+=" --verifcolor=\"$VERIF_COLOR\""
    cmd+=" --wrongcolor=\"$WRONG_COLOR\""
    cmd+=" --keyhlcolor=\"$KEYHL_COLOR\""
    cmd+=" --bshlcolor=\"$BSHL_COLOR\""
    
    # Display options
    if [[ "$SHOW_INDICATOR" == "true" ]]; then
        cmd+=" --indicator"
    fi
    
    if [[ "$SHOW_CLOCK" == "true" ]]; then
        cmd+=" --clock"
        cmd+=" --timecolor=\"$TIME_COLOR\""
        cmd+=" --timestr=\"$TIME_FORMAT\""
        cmd+=" --time-font=\"$FONT_FAMILY\""
        cmd+=" --time-size=$TIME_SIZE"
        
        if [[ "$SHOW_DATE" == "true" ]]; then
            cmd+=" --datecolor=\"$DATE_COLOR\""
            cmd+=" --datestr=\"$DATE_FORMAT\""
            cmd+=" --date-font=\"$FONT_FAMILY\""
            cmd+=" --date-size=$DATE_SIZE"
        fi
    fi
    
    # Ring settings
    cmd+=" --radius=$RING_RADIUS"
    cmd+=" --ring-width=$RING_WIDTH"
    
    # Font settings for other elements
    cmd+=" --layout-font=\"$FONT_FAMILY\""
    cmd+=" --verif-font=\"$FONT_FAMILY\""
    cmd+=" --wrong-font=\"$FONT_FAMILY\""
    cmd+=" --layout-size=$LAYOUT_SIZE"
    cmd+=" --verif-size=$VERIF_SIZE"
    cmd+=" --wrong-size=$WRONG_SIZE"
    
    echo "$cmd"
}

# Function to cleanup
cleanup() {
    [[ -f "$TEMP_BG" ]] && rm -f "$TEMP_BG"
}

# Main execution
main() {
    # Trap for cleanup
    trap cleanup EXIT
    
    # Create background
    create_background
    
    # Build and execute lock command
    local lock_cmd
    lock_cmd=$(build_lock_command)
    
    echo "Executing: $lock_cmd"
    eval "$lock_cmd"
}

# Run main function
main "$@"
