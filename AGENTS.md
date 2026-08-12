# Agent Context: config dotfiles

## Overview

This directory (`~/.config/`) contains dotfiles for a Linux desktop setup using Wayland with Hyprland compositor. The theming follows a dark violet palette.

## Color Palette

Reference: `README.md` for full palette documentation.

| Color | Name | Hex | Role |
|-------|------|-----|------|
| 1 | Pale Mauve | `#F9DAEF` | Primary text |
| 2 | Thistle | `#D7BDEC` | Secondary text |
| 3 | Plum | `#D18DBD` | Tertiary accent |
| 4 | Soft Periwinkle | `#8485D9` | Primary accent |
| 5 | Hot Pink | `#CB3977` | Accent |
| 6 | Berry Blush | `#A44E88` | Error/highlight |
| 7 | Grape Soda | `#724782` | Muted accent |
| 8 | Deep Purple | `#33214B` | Dark surface |
| 9 | Deep Berry | `#421E3D` | Dark surface |
| 10 | Black | `#090307` | Background |

## Themed Software

| Software | Config Path | Theme File | Notes |
|----------|-------------|------------|-------|
| Waybar | `~/.config/waybar/` | `style.css`, `config.jsonc` | Status bar - outlined modules, circular workspaces |
| Hyprland | `~/.config/hypr/` | `hyprland.lua` | Compositor - uses Lua config format |
| Kitty | `~/.config/kitty/` | `themes/custom.conf` | Terminal - include from `kitty.conf` |
| Wofi | `~/.config/wofi/` | `style.css` | App launcher - launched with `--style` flag |
| Mako | `~/.config/mako/` | `config` | Notifications - uses hex+alpha for transparency |
| Zed | `~/.config/zed/` | `themes/coastal-slate.json` | Code editor - JSON theme format |
| Pi | `~/.pi/agent/themes/` | `coastal-slate.json` | AI coding agent theme |

## Key Design Decisions

- **Dark theme**: Near-black background with thistle text for high contrast
- **Outlined modules**: Waybar modules use `border: 1px solid` with transparent background
- **Circular workspaces**: 18px circles with numbers, active=Grape Soda (0.7 opacity), inactive=Thistle (0.2 opacity)
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
│   └── config           # Notification daemon
├── waybar/
│   ├── config.jsonc     # Module layout and settings
│   ├── style.css        # Visual styling
│   └── scripts/
│       └── system.sh    # Custom system stats module
├── wofi/
│   ├── config           # Wofi settings
│   └── style.css        # Wofi styling
└── zed/
    ├── settings.json    # Editor settings
    └── themes/
        └── coastal-slate.json # Zed theme
```

## Important Notes

- **Only use colors from the palette above** - never introduce new colors
- Hyprland uses Lua config (`hyprland.lua`), not traditional `.conf`
- Wofi requires `--style` flag in Hyprland keybind to load theme
- Mako uses hex+alpha format for transparency (e.g., `#D7BDECcc` for 80% opacity)
- GTK CSS (used by Waybar/Wofi) has limited animation support
- Always use `pkill -SIGUSR2 waybar` for config reload, full restart for style changes
- Never use `git add .` - always stage specific files
