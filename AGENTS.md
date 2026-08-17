# Agent Context: config dotfiles

## Overview

This directory (`~/.config/`) contains dotfiles for a Linux desktop setup using Wayland with Hyprland compositor. The theming uses a monochrome palette with separate accent colors.

## Color Palette

Reference: `README.md` for full palette documentation. The base theme is monochrome, with separate accent colors.

| Color | Name | Hex | Role |
|-------|------|-----|------|
| 1 | Bright Snow | `#f8f9faff` | Primary text |
| 2 | Platinum | `#e9ecefff` | Secondary text |
| 3 | Alabaster Grey | `#dee2e6ff` | Tertiary text |
| 4 | Pale Slate | `#ced4daff` | Borders |
| 5 | Pale Slate 2 | `#adb5bdff` | Muted text |
| 6 | Slate Grey | `#6c757dff` | Muted accent |
| 7 | Iron Grey | `#495057ff` | Surface |
| 8 | Gunmetal | `#343a40ff` | Dark surface |
| 9 | Carbon Black | `#212529ff` | Background |

### Accent Colors

| Color | Name | Hex | Role |
|-------|------|-----|------|
| 1 | Dry Sage | `#a3b18aff` | Accent |
| 2 | Brick Red | `#c1121fff` | Accent |
| 3 | Deep Space Blue | `#003049ff` | Accent |
| 4 | Steel Blue | `#669bbcff` | Accent |

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

- **Dark theme**: Carbon Black background with Bright Snow and Platinum text for high contrast
- **Outlined modules**: Waybar modules use `border: 1px solid` with transparent background
- **Circular workspaces**: 18px circles with numbers, active=Slate Grey (0.7 opacity), inactive=Pale Slate 2 (0.2 opacity)
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

- **Only use colors from the documented palette** - never introduce new colors
- Hyprland uses Lua config (`hyprland.lua`), not traditional `.conf`
- Wofi requires `--style` flag in Hyprland keybind to load theme
- Mako uses the palette's 8-digit hex values for transparency (e.g., `#e9ecefff`)
- GTK CSS (used by Waybar/Wofi) has limited animation support
- Always use `pkill -SIGUSR2 waybar` for config reload, full restart for style changes
- Never use `git add .` - always stage specific files
