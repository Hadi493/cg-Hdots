#!/bin/bash

# Clipboard menu styled like app menu

# Get clipboard history with clean formatting
get_formatted_history() {
    cliphist list | while IFS= read -r line; do
        content=$(echo "$line" | cliphist decode)
        
        # Clean up formatting and limit to reasonable length for display
        content=$(echo "$content" | tr '\n\t' ' ' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//')
        
        # Truncate if too long but keep it readable
        if [ ${#content} -gt 100 ]; then
            content="${content:0:97}..."
        fi
        
        echo "$content|$line"
    done
}

# Show rofi menu with same style as app menu
selected=$(get_formatted_history | rofi -dmenu -i \
    -p "Clipboard" \
    -theme ~/.config/rofi/config.rasi \
    -theme-str 'prompt { background-color: @blue; }' \
    -theme-str 'entry { placeholder: "Search clipboard history..."; }' \
    -theme-str 'window { width: 600px; }' \
    -theme-str 'listview { lines: 12; }')

if [ -n "$selected" ]; then
    # Extract the original line (after the |)
    original_line=$(echo "$selected" | cut -d'|' -f2-)
    # Decode and copy to clipboard
    echo "$original_line" | cliphist decode | wl-copy
    
    # Show notification matching the theme
    notify-send "Clipboard" "Content copied successfully" -t 2000 -i clipboard
fi