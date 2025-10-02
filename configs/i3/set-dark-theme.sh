#!/bin/bash
# Script to set dark theme environment variables for new applications

# Export dark theme variables
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE=Adwaita-Dark  
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_APPLICATION_PREFER_DARK_THEME=1
export ELECTRON_FORCE_DARK_MODE=1
export PREFER_DARK=1

# Update dconf/gsettings for GNOME applications
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark' 2>/dev/null || true
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' 2>/dev/null || true
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true

# Also export for any application launched from this script
exec "$@"
