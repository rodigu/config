# config dotfiles

## Theme: Coastal Slate

A muted, coastal-inspired light theme pairing cool slate blues with warm earthy neutrals. Cerulean and blue bell accents float over a soft linen backdrop, grounded by gunmetal text and granite undertones.

### Design Philosophy

- **Light backdrop**: Soft Linen provides a warm, natural base
- **Dark text**: Gunmetal ensures maximum readability
- **Blue modules**: Blue Bell keeps the cool, coastal aesthetic
- **Warm accents**: Tuscan Sun and Dry Sage add earthy energy
- **Muted undertones**: Granite and Cerulean ground the palette

## Color Palette

*Cool slate blues, warm linen neutrals, and sunlit gold — coastal calm meets earthy warmth.*

| Color | Name | Hex | Role | Description |
|-------|------|-----|------|-------------|
| 1 | Gunmetal | `#3B3B3B` | Text | Dark charcoal gray for primary text with strong readability. |
| 2 | Cerulean | `#407489` | Muted accent | Deep slate blue evoking calm coastal waters. |
| 3 | Blue Bell | `#4C98C3` | Primary accent | Medium sky blue for interactive elements and modules. |
| 4 | Pacific Blue | `#64AEC4` | Highlight | Bright aqua blue for active states and highlights. |
| 5 | Granite | `#4F5D4E` | Muted text | Dark green-gray for secondary text and subtle elements. |
| 6 | Dry Sage | `#C1BD8E` | Secondary accent | Muted yellow-green for earthy warmth and soft highlights. |
| 7 | Soft Linen | `#E3E8E1` | Background | Warm off-white for a natural, inviting base. |
| 8 | Tuscan Sun | `#FAC244` | Warning/Highlight | Golden yellow for warnings and energetic accents. |
| 9 | Lobster Pink | `#B76862` | Error | Muted pink-red for errors and destructive actions. |

### CSS Variables

[coolors url](https://coolors.co/palette/3b3b3b-407489-4c98c3-64aec4-4f5d4e-c1bd8e-e3e8e1-fac244-b76862)

```css
/* CSS HEX */
--gunmetal: #3B3B3Bff;
--cerulean: #407489ff;
--blue-bell: #4C98C3ff;
--pacific-blue: #64AEC4ff;
--granite: #4F5D4Eff;
--dry-sage: #C1BD8Eff;
--soft-linen: #E3E8E1ff;
--tuscan-sun: #FAC244ff;
--lobster-pink: #B76862ff;

/* CSS HSL */
--gunmetal: hsla(0, 0%, 23%, 1);
--cerulean: hsla(197, 36%, 39%, 1);
--blue-bell: hsla(202, 50%, 53%, 1);
--pacific-blue: hsla(194, 45%, 58%, 1);
--granite: hsla(116, 9%, 34%, 1);
--dry-sage: hsla(55, 29%, 66%, 1);
--soft-linen: hsla(103, 13%, 90%, 1);
--tuscan-sun: hsla(42, 95%, 62%, 1);
--lobster-pink: hsla(4, 37%, 55%, 1);
```

### Usage

| Role | Color | Applied To |
|------|-------|------------|
| Background | Transparent | Waybar bar (fully transparent) |
| Modules | Blue Bell `#4C98C3` (0.7 opacity) | Waybar modules (outlined, no solid fill) |
| Workspace (active) | Granite `#4F5D4E` (0.7 opacity) | Active workspace circle |
| Workspace (inactive) | Soft Linen `#E3E8E1` (0.2 opacity) | Inactive workspace circles |
| Error | Lobster Pink `#B76862` | Error states, destructive actions |
| Text | Gunmetal `#3B3B3B` | Waybar text, kitty foreground, pi message text |
| Accent | Dry Sage `#C1BD8E` | Charging states, power saver mode, wofi selection |
| Warning | Tuscan Sun `#FAC244` | Urgent workspaces, critical battery, disconnected states |
| Muted | Granite `#4F5D4E` | Secondary text, subtle accents |

### Themed Software

| Software | Config Location | Theme File |
|----------|-----------------|------------|
| [Waybar](https://github.com/Alexays/Waybar) | `~/.config/waybar/` | `style.css` |
| [Hyprland](https://hyprland.org) | `~/.config/hypr/` | `hyprland.lua` |
| [Kitty](https://sw.kovidgoyal.net/kitty/) | `~/.config/kitty/` | `themes/custom.conf` |
| [Wofi](https://hg.sr.ht/~scoopta/wofi) | `~/.config/wofi/` | `style.css` |
| [Mako](https://github.com/emersion/mako) | `~/.config/mako/` | `config` |
| [Pi](https://github.com/earendil-works/pi) | `~/.pi/agent/themes/` | `coastal-slate.json` |
