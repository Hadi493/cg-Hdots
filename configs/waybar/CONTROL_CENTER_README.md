# Control Center & Power Menu Setup

## 🎛️ Waybar Buttons

### Control Center Button: `󰒓`
- **Location:** Right side of waybar (blue button with curved end caps)
- **Function:** Opens comprehensive control center with all system controls
- **Includes:** Volume, brightness, Wi-Fi, Bluetooth, calendar, TODO, notifications

### Power Button: `⏻` 
- **Location:** Right side of waybar (red button)
- **Function:** Opens dedicated power menu
- **Options:** Lock, Sleep, Logout, Reboot, Shutdown (with confirmations)

## ⌨️ Keyboard Shortcuts

- `Super + Escape` - Open power menu
- `Super + O` - Toggle window opacity (100% ↔ 88%)

## 📜 Available Scripts

### Main Scripts
- `~/.config/waybar/scripts/control_center.sh` - Full featured control center
- `~/.config/waybar/scripts/control_center_test.sh` - Simplified control center (currently active)
- `~/.config/waybar/scripts/power_menu_new.sh` - Beautiful power menu
- `~/.config/waybar/scripts/quick_actions.sh` - Fast common actions

### Utility Scripts  
- `~/.config/waybar/scripts/toggle_opacity.sh` - Window opacity toggle
- `~/.config/waybar/scripts/notification_center.sh` - Notification viewer
- `~/.config/waybar/scripts/notification_indicator.sh` - Notification status

## 🎨 Design Features

### "End" Style Elements
- Curved decorative caps around control center (`custom/l_end`, `custom/r_end`)
- Matches popular dotfiles aesthetics you requested
- Seamlessly integrated with your Catppuccin theme

### Color Coding
- **Control Center:** Blue (`#89b4fa`) - System controls and settings
- **Power Button:** Red (`#f38ba8`) - Power operations
- **Hover Effects:** Matching your existing module hover styles

## 🛠️ Functionality

### Control Center Features
- **Volume Control:** Quick presets (25%, 50%, 75%, 100%) + mute toggle
- **Brightness:** Quick brightness levels 
- **Network:** Wi-Fi toggle and settings access
- **Bluetooth:** Toggle bluetooth on/off
- **Calendar:** Current date display
- **System Actions:** Lock, sleep, logout, reboot, shutdown

### Power Menu Features  
- **Lock Screen:** Uses `hyprlock`
- **Sleep:** System suspend with confirmation
- **Logout:** Exit Hyprland with confirmation
- **Reboot:** System reboot with confirmation  
- **Shutdown:** System poweroff with confirmation

### Safety Features
- All destructive actions require confirmation
- Clear visual feedback via notifications
- Proper integration with systemd power management

## 📋 TODO System
- Simple text-based TODO list: `~/.config/waybar/todo.txt`
- Add todos directly from control center
- Edit with your preferred text editor

## 🎯 Usage Tips

1. **Quick Volume:** Click control center → Volume Control
2. **Quick Lock:** Click power button → Lock Screen  
3. **Emergency Power:** `Super + Escape` → Shutdown/Reboot
4. **Window Transparency:** `Super + O` to toggle any window opacity
5. **Notifications:** Built-in notification center access

All menus use rofi with your Catppuccin theme for consistent appearance!