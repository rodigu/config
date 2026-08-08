# Agent Context: config dotfiles

## Overview

This directory (`~/.config/`) contains dotfiles for a Linux desktop setup using Wayland with Hyprland compositor. The theming follows a "Coastal Slate" palette with light mode design.

## Color Palette

Reference: `README.md` for full palette documentation.

| Color | Name | Hex | Role |
|-------|------|-----|------|
| 1 | Gunmetal | `#3B3B3B` | Primary text |
| 2 | Cerulean | `#407489` | Muted accent |
| 3 | Blue Bell | `#4C98C3` | Primary accent |
| 4 | Pacific Blue | `#64AEC4` | Highlight accent |
| 5 | Granite | `#4F5D4E` | Muted text |
| 6 | Dry Sage | `#C1BD8E` | Secondary accent |
| 7 | Soft Linen | `#E3E8E1` | Background |
| 8 | Tuscan Sun | `#FAC244` | Warning/highlight |
| 9 | Lobster Pink | `#B76862` | Error |

## Themed Software

| Software | Config Path | Theme File | Notes |
|----------|-------------|------------|-------|
| Waybar | `~/.config/waybar/` | `style.css`, `config.jsonc` | Status bar - outlined modules, circular workspaces |
| Hyprland | `~/.config/hypr/` | `hyprland.lua` | Compositor - uses Lua config format |
| Kitty | `~/.config/kitty/` | `themes/custom.conf` | Terminal - include from `kitty.conf` |
| Wofi | `~/.config/wofi/` | `style.css` | App launcher - launched with `--style` flag |
| Mako | `~/.config/mako/` | `config` | Notifications - uses hex+alpha for transparency |
| Pi | `~/.pi/agent/themes/` | `coastal-slate.json` | AI coding agent theme |

## Key Design Decisions

- **Light theme**: Soft Linen background with gunmetal text for high contrast
- **Outlined modules**: Waybar modules use `border: 1px solid` with transparent background
- **Circular workspaces**: 18px circles with numbers, active=Granite (0.7 opacity), inactive=Soft Linen (0.2 opacity)
- **Transparency**: Modules at 0.7, bar is fully transparent
- **Rounding**: 5px for modules, 10px for bar

## Common Commands

```bash
# Reload waybar (config changes)
pkill -SIGUSR2 waybar

# Restart waybar (style changes)
killall waybar && waybar &

# Reload hyprland
hyprctl reload

# Restart mako
pkill mako && mako &

# Test notification
notify-send "Title" "Body"
```

## File Structure

```
~/.config/
├── AGENTS.md           # This file - agent context
├── README.md           # Palette documentation
├── hypr/
│   └── hyprland.lua    # Hyprland config (Lua)
├── kitty/
│   ├── kitty.conf      # Main config (includes theme)
│   └── themes/
│       └── custom.conf # Kitty theme
├── mako/
│   └── config          # Notification daemon
├── waybar/
│   ├── config.jsonc    # Module layout and settings
│   ├── style.css       # Visual styling
│   └── scripts/
│       └── system.sh   # Custom system stats module
└── wofi/
    ├── config          # Wofi settings
    └── style.css       # Wofi styling
```

## Important Notes

- Hyprland uses Lua config (`hyprland.lua`), not traditional `.conf`
- Wofi requires `--style` flag in Hyprland keybind to load theme
- Mako uses hex+alpha format for transparency (e.g., `#e3e8e1cc` for 80%)
- GTK CSS (used by Waybar/Wofi) has limited animation support
- Always use `pkill -SIGUSR2 waybar` for config reload, full restart for style changes
- Never use `git add .` - always stage specific files
