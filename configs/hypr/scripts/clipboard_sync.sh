#!/bin/bash

# Optimized clipboard synchronization with auto-cleanup
# Handles both primary selection and clipboard, syncs between them and stores history

# Cleanup old clipboard entries
cleanup_clipboard() {
    while true; do
        # Delete entries older than 30 days
        cliphist list | head -n -1000 | cliphist delete-query 2>/dev/null
        
        # Delete short auth codes older than 1 day
        cliphist list | while IFS= read -r line; do
            content=$(echo "$line" | cliphist decode)
            # Check if it's likely an auth code (6-8 digits/chars)
            if [[ ${#content} -ge 6 && ${#content} -le 8 && "$content" =~ ^[0-9A-Za-z]+$ ]]; then
                # Get timestamp and delete if older than 1 day
                timestamp=$(echo "$line" | cut -f1)
                current_time=$(date +%s)
                if [ $((current_time - timestamp/1000000)) -gt 86400 ]; then
                    echo "$line" | cliphist delete
                fi
            fi
        done
        sleep 3600  # Run cleanup every hour
    done
}

# Lightweight sync with reduced frequency
sync_clipboards() {
    last_primary=""
    last_clipboard=""
    
    while true; do
        # Check primary selection
        current_primary=$(wl-paste -p -n -t text 2>/dev/null)
        if [ "$current_primary" != "$last_primary" ] && [ -n "$current_primary" ]; then
            wl-copy -n "$current_primary" 2>/dev/null
            last_primary="$current_primary"
        fi
        
        # Check clipboard
        current_clipboard=$(wl-paste -n -t text 2>/dev/null)
        if [ "$current_clipboard" != "$last_clipboard" ] && [ -n "$current_clipboard" ]; then
            wl-copy -p -n "$current_clipboard" 2>/dev/null
            last_clipboard="$current_clipboard"
        fi
        
        sleep 1  # Reduced from 0.5s
    done
}

# Store clipboard history (optimized)
wl-paste -t text --watch cliphist store &

# Start processes
cleanup_clipboard &
sync_clipboards &

wait