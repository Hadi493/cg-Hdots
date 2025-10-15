#!/bin/bash

# Simple clipboard menu that actually works

# Manual clipboard history file
CLIPBOARD_FILE="$HOME/.cache/clipboard_history"
mkdir -p "$(dirname "$CLIPBOARD_FILE")"

# Function to add current clipboard to history
add_to_history() {
    local current=$(wl-paste 2>/dev/null)
    if [ -n "$current" ] && [ ${#current} -lt 10000 ]; then
        # Remove if already exists to avoid duplicates
        if [ -f "$CLIPBOARD_FILE" ]; then
            grep -Fxv "$current" "$CLIPBOARD_FILE" > "$CLIPBOARD_FILE.tmp" || true
            mv "$CLIPBOARD_FILE.tmp" "$CLIPBOARD_FILE"
        fi
        # Add to top
        echo "$current" | cat - "$CLIPBOARD_FILE" 2>/dev/null | head -50 > "$CLIPBOARD_FILE.new"
        mv "$CLIPBOARD_FILE.new" "$CLIPBOARD_FILE"
    fi
}

# Add current clipboard to history
add_to_history

# Create menu from history
create_menu() {
    if [ ! -f "$CLIPBOARD_FILE" ]; then
        echo "No clipboard history"
        return
    fi
    
    local counter=1
    while IFS= read -r line && [ $counter -le 10000 ]; do
        # Skip empty lines
        [ -z "$line" ] && continue
        
        # Clean display text
        display=$(echo "$line" | tr '\n\t\r' ' ' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//')
        
        # Truncate if needed
        if [ ${#display} -gt 80 ]; then
            display="${display:0:77}..."
        fi
        
        echo "$display"
        counter=$((counter + 1))
    done < "$CLIPBOARD_FILE"
}

# Show menu
menu_content=$(create_menu)

if [ -z "$menu_content" ]; then
    notify-send "Clipboard" "No history available" -t 2000
    exit 1
fi

selected=$(echo "$menu_content" | rofi -dmenu -i \
    -p "Clipboard" \
    -theme ~/.config/rofi/config.rasi \
    -theme-str 'window { width: 700px; }' \
    -theme-str 'listview { lines: 10; }')

# Copy selected entry
if [ -n "$selected" ]; then
    # Find matching line in history file
    counter=1
    while IFS= read -r line && [ $counter -le 20 ]; do
        [ -z "$line" ] && continue
        
        display=$(echo "$line" | tr '\n\t\r' ' ' | sed 's/  */ /g' | sed 's/^ *//;s/ *$//')
        if [ ${#display} -gt 80 ]; then
            display="${display:0:77}..."
        fi
        
        if [ "$display" = "$selected" ]; then
            echo "$line" | wl-copy
            notify-send "Clipboard" "Copied: $(echo "$line" | cut -c1-30)..." -t 1500
            break
        fi
        counter=$((counter + 1))
    done < "$CLIPBOARD_FILE"
fi
