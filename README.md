# Minimalist Starter Arch Linux(Hyprland) Dotfiles

A comprehensive collection of configuration files for a clean, productive Linux desktop environment.

![Fish Shell Prompt](./screenshots/terminal_1.png)
![Fish Shell Prompt](./screenshots/terminal_2.png)
![Apps Menu](./screenshots/apps_menu.png)
![Apps Menu](./screenshots/quick_settings-1.png)
![Apps Menu](./screenshots/quick_settings-2.png)
![Wallpaper Changer](./screenshots/wallpaper_selection.png)
![Window](./screenshots/window.png)
![Waybar](./configs/waybar/cg-waybar.png)
---

[Hyprland CG Manual](./cg-man.md)

---

## Features

- **Multi-WM Support**: Hyprland, Sway, and i3 configurations
- **Consistent Theme**: Unified color scheme across all applications  
- **Enhanced Terminal**: Custom Fish shell with intelligent prompt
- **Efficient Workflow**: Optimized keybindings and automation scripts

## Included Configurations

### Applications
- **Fish Shell** - Enhanced prompt with git integration and performance timing
- **Helix** - Modern text editor configuration
- **Neovim** - Vim-compatible editor setup
- **Kitty** - GPU-accelerated terminal emulator
- **Qutebrowser** - Keyboard-driven web browser

### System UI
- **Waybar** - Wayland status bar
- **Rofi** - Application launcher and window switcher
- **Dunst/Mako** - Notification daemons

## Installation

```bash
git clone https://github.com/Hadi493/dotfiles
cd dotfiles
```
`copy configs to your config dir`

1. Clone the repository
2. Copy desired configs to `~/.config/`
3. Install required dependencies
4. Restart your session

## Dependencies

### Core
- Fish shell
- Git
- A Nerd Font (recommended: Iosevka)

### Window Manager Specific
**Hyprland:**
- waybar, rofi, dunst/mako
- wl-clipboard, swww, hyprshot


### Applications
- helix, neovim, kitty
- qutebrowser (optional)

## Key Features

### Fish Shell Prompt
- Git branch and status integration
- Command execution timing
- Virtual environment detection  
- Clean two-line design with Unicode styling

### Window Manager Setup
- Consistent keybindings across WMs
- Automated workspace management
- Integrated screenshot and clipboard tools
- Dynamic wallpaper management

## Customization

All configs use consistent color variables making theme changes straightforward. Edit the color definitions in each config file to match your preferences.

## Contributing

Feel free to submit issues and pull requests. All contributions are welcome.

## License

MIT License - Feel free to use and modify as needed.
