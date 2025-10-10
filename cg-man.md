# cg-man

This document outlines the keybindings and useful tools configured in your Hyprland environment.

## Useful Tools

| Variable        | Command                                               | Description                     |
| --------------- | ----------------------------------------------------- | ----------------------------    |
| `$terminal`     | `kitty`                                               | The default terminal            |
| `$fileManager`  | `dolphin`                                             | The default file manager        |
| `$discord`      | `vesktop-wayland`                                     | Discord client                  |
| `$menu`         | `rofi -show drun`                                     | Application launcher menu       |
| `$toggle_waybar`| `~/.config/waybar/scripts/toggle_waybar.sh`           | Script to toggle the status bar |

## System Keybindings

The main modifier key is `SUPER` (Windows key).

### Application Launchers

| Keybinding          | Action                                  |
| ------------------- | --------------------------------------  |
| `SUPER + Return`    | Launch Terminal (`kitty`)               |
| `SUPER + E`         | Launch File Manager (`dolphin`)         |
| `SUPER + D`         | Launch Application Menu (`rofi`)        |
| `SUPER + B`         | Launch Firefox                          |
| `SUPER + V`         | Launch Discord (`vesktop`)              |
| `ALT + B`           | Launch Chromium                         |
| `ALT + T`           | Launch Twitter                          |
| `CTRL + E`          | Run Doom Emacs                          |    

### Window & Workspace Management

| Keybinding                     | Action                                            |
| --------------------------     | ------------------------------------------------- |
| `SUPER + Q`                    | Close the active window                           |
| `SUPER + Space`                | Toggle floating mode for the active window        |
| `SUPER + F`                    | Toggle fullscreen mode                            |
| `SUPER + J`                    | Toggle split direction (dwindle layout)           |
| `SUPER + P`                    | Toggle pseudotiling (dwindle layout)              |
| `SUPER + [0-9]`                | Switch to workspace 1-10                          |
| `SUPER + SHIFT + [0-9]`        | Move active window to workspace 1-10              |
| `SUPER + S`                    | Toggle special workspace (scratchpad)             |
| `SUPER + SHIFT + S`            | Move active window to special workspace           |
| `SUPER + Arrow Keys`           | Move focus between windows                        |
| `SUPER + SHIFT + Arrow Keys`   | Move the active window                            |
| `SUPER + CTRL + Arrow Keys`    | Resize the active window                          |
| `SUPER + Mouse Scroll`         | Cycle through workspaces                          |
| `SUPER + Left Mouse`           | Drag to move window                               |
| `SUPER + Right Mouse`          | Drag to resize window                             |

### System & Session Control

| Keybinding               | Action                                 |
| ------------------------ | -------------------------------------- |
| `SUPER + M`              | Exit Hyprland session                  |
| `SUPER + L`              | Lock the screen (`hyprlock`)           |
| `SUPER + SHIFT + X`      | Exit Hyprland session (alternative)    |
| `SUPER + SHIFT + S`      | Suspend system (`systemctl suspend`)   |
| `SUPER + SHIFT + R`      | Reboot system (`systemctl reboot`)     |
| `SUPER + SHIFT + P`      | Power off system (`systemctl poweroff`)|
| `ALT + P`                | Show Power Menu                        |

### Scripts & Tools

| Keybinding           | Action                                        |
| -------------------- | --------------------------------------------- |
| `SUPER + C`          | Open color picker and copy hex to clipboard   |
| `ALT + V`            | Show clipboard history menu                   |
| `SUPER + O`          | Toggle opacity of the active window           |
| `ALT + C`            | Show Control Center                           |
| `ALT + Q`            | Show Quick Actions menu                       |
| `SUPER + W`          | Toggle Waybar visibility                      |
| `ALT + W`            | Select a new wallpaper                        |
| `CTRL + W`           | Change to the next wallpaper                  |

### Screenshots (using `hyprshot`)

| Keybinding      | Action                                          |
| --------------- | ----------------------------------------------- |
| `SUPER + Print` | Screenshot the active window                    |
| `Print`         | Screenshot the entire monitor                   |
| `SHIFT + Print` | Screenshot a selected region                    |

### Quick System Controls

| Keybinding          | Action                               |
| ------------------- | ------------------------------------ |
| `SUPER + CTRL + V`  | Set volume to 50%                    |
| `SUPER + CTRL + M`  | Toggle mute                          |
| `SUPER + CTRL + B`  | Set brightness to 50%                |
| `SUPER + CTRL + W`  | Toggle Wi-Fi                         |

### Multimedia & Hardware Keys

| Keybinding                  | Action                               |
| --------------------------- | ------------------------------------ |
| `XF86AudioRaiseVolume`      | Increase volume by 5%                |
| `XF86AudioLowerVolume`      | Decrease volume by 5%                |
| `XF86AudioMute`             | Toggle speaker mute                  |
| `XF86AudioMicMute`          | Toggle microphone mute               |
| `XF86MonBrightnessUp`       | Increase brightness by 5%            |
| `XF86MonBrightnessDown`     | Decrease brightness by 5%            |
| `XF86AudioNext`             | Next media track (`playerctl`)       |
| `XF86AudioPrev`             | Previous media track (`playerctl`)   |
| `XF86AudioPlay`/`Pause`     | Play/Pause media (`playerctl`)       |
