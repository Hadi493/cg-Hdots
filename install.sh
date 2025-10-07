#!/bin/bash

# Minimalist Dotfiles Installer
set -e

CONFIG_DIR="$HOME/.config"
BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"

echo "Installing minimalist dotfiles..."

# Create backup of existing configs
if [ -d "$CONFIG_DIR" ]; then
    echo "Backing up existing configs to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
    
    for config in hypr sway i3 fish helix nvim kitty qutebrowser rofi waybar polybar dunst mako; do
        if [ -d "$CONFIG_DIR/$config" ]; then
            cp -r "$CONFIG_DIR/$config" "$BACKUP_DIR/"
            echo "Backed up $config"
        fi
    done
fi

# Install configurations
echo "Installing new configurations..."
mkdir -p "$CONFIG_DIR"

for config_dir in configs/*/; do
    config_name=$(basename "$config_dir")
    if [ "$config_name" != "custom_scripts" ]; then
        cp -r "$config_dir" "$CONFIG_DIR/$config_name"
        echo "Installed $config_name"
    fi
done

# Install custom scripts
if [ -d "configs/custom_scripts" ]; then
    mkdir -p "$HOME/.local/bin"
    cp configs/custom_scripts/* "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin"/*
    echo "Installed custom scripts to ~/.local/bin"
fi

# Install vimrc
if [ -f "configs/.vimrc" ]; then
    cp "configs/.vimrc" "$HOME/"
    echo "Installed .vimrc"
fi

echo "Installation complete!"
echo "Backup available at: $BACKUP_DIR"
echo "Please restart your session or reload your shell configuration."
echo ""
echo "Note: You may need to install additional dependencies based on your chosen window manager."