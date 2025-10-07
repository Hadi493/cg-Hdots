#!/bin/bash

# Comprehensive clipboard synchronization script
# Handles both primary selection and clipboard, syncs between them and stores history

# Function to sync primary to clipboard
sync_primary_to_clipboard() {
    while true; do
        wl-paste -p -n -t text 2>/dev/null | wl-copy -n 2>/dev/null
        sleep 0.5
    done
}

# Function to sync clipboard to primary  
sync_clipboard_to_primary() {
    while true; do
        wl-paste -n -t text 2>/dev/null | wl-copy -p -n 2>/dev/null
        sleep 0.5
    done
}

# Function to store clipboard history
store_clipboard_history() {
    wl-paste -t text --watch cliphist store 2>/dev/null &
    wl-paste -p -t text --watch cliphist store 2>/dev/null &
}

# Start all clipboard sync processes in background
sync_primary_to_clipboard &
sync_clipboard_to_primary &
store_clipboard_history

# Keep script running
wait