#!/bin/bash

# Optimized clipboard synchronization with auto-cleanup and proper ordering
set -e

# Cleanup old clipboard entries
cleanup_clipboard() {
    while true; do
        # Keep only last 1000 entries (newest first)
        cliphist list | tail -n +1001 | while IFS= read -r line; do
            echo "$line" | cliphist delete 2>/dev/null || true
        done
        
        # Delete short auth codes older than 1 day
        cliphist list | while IFS= read -r line; do
            content=$(echo "$line" | cliphist decode 2>/dev/null || continue)
            # Check if it's likely an auth code (6-8 digits/chars only)
            if [[ ${#content} -ge 6 && ${#content} -le 8 && "$content" =~ ^[0-9A-Za-z]+$ ]]; then
                # Get timestamp and delete if older than 1 day
                timestamp=$(echo "$line" | cut -f1 | tr -d '[:space:]')
                if [[ "$timestamp" =~ ^[0-9]+$ ]]; then
                    current_time=$(date +%s)
                    entry_time=$((timestamp / 1000000))
                    if [ $((current_time - entry_time)) -gt 86400 ]; then
                        echo "$line" | cliphist delete 2>/dev/null || true
                    fi
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
        current_primary=$(wl-paste -p -n -t text 2>/dev/null || echo "")
        if [ "$current_primary" != "$last_primary" ] && [ -n "$current_primary" ]; then
            wl-copy -n "$current_primary" 2>/dev/null || true
            last_primary="$current_primary"
        fi
        
        # Check clipboard
        current_clipboard=$(wl-paste -n -t text 2>/dev/null || echo "")
        if [ "$current_clipboard" != "$last_clipboard" ] && [ -n "$current_clipboard" ]; then
            wl-copy -p -n "$current_clipboard" 2>/dev/null || true
            last_clipboard="$current_clipboard"
        fi
        
        sleep 1
    done
}

# Store clipboard history with proper ordering (newest first)
wl-paste -t text --watch cliphist store &

# Start background processes
cleanup_clipboard &
sync_clipboards &

# Keep script running
wait