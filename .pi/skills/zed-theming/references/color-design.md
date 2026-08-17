# Designing a Zed color system

Build a theme from semantic roles rather than replacing colors mechanically.

## Start with surfaces

Choose a small surface hierarchy:

1. application background
2. editor background
3. ordinary panels and tabs
4. elevated menus and dialogs
5. hover, active, and selected controls

Light themes usually place the editor and application background near the lightest value. Dark themes usually reserve the darkest value for the editor and terminal, then increase lightness for panels and controls. Blurred themes need alpha on the surfaces that should reveal the desktop blur.

## Add a text hierarchy

Define primary, secondary, muted, placeholder, disabled, and accent text. Check each against the surface where it appears. A color that works on the editor may fail on a toolbar or selected row.

## Add interaction colors

Focus, selection, links, search matches, and active guides need related but distinguishable colors. Use low-alpha backgrounds for highlights and stronger opaque colors for text and borders.

## Add semantic colors

Map colors to meaning consistently:

- errors and destructive changes
- warnings
- informational states
- successful operations
- additions, modifications, deletions, conflicts, and renames

Each state can use a foreground, a low-alpha background, and a stronger border. In a restrained palette, contrast and alpha can distinguish states when hue is limited.

## Syntax highlighting

Syntax colors should support reading source code, not compete with the UI. A practical map gives related scopes related colors:

- comments: muted color, optionally italic
- keywords and control flow: strong accent
- strings and literals: a second accent
- types, functions, and properties: related but distinct accents
- punctuation and operators: readable foreground or a muted tone
- declarations and titles: stronger weight or brighter foreground where useful

Keep syntax colors legible against the editor background. Preserve the scope names supplied by an existing theme when adapting it.

## Terminal colors

ANSI slots have conventional meanings, but a custom theme can map them to its own palette. Keep the normal, bright, and dim variants distinguishable. Test common shell output, errors, directories, prompts, and selection text rather than checking the UI alone.

## Transparency and blur

Eight-digit hex colors use `#RRGGBBAA`. Common alpha values include:

- `00`: transparent
- `1A`: roughly 10%
- `33`: roughly 20%
- `66`: roughly 40%
- `99`: roughly 60%
- `CC`: roughly 80%
- `FF`: opaque

These are approximate visual values. Use the alpha that matches the intended surface and test the theme over different desktop backgrounds. For a blurred theme, use `"background.appearance": "blurred"`, keep the main background translucent, and make editor/gutter/terminal surfaces transparent when appropriate.

## Palette constraints

If a project supplies a fixed palette, use only that palette and its alpha variants. If not, choose colors intentionally and document the roles. Never introduce near-duplicate colors just to fill every field; reuse a role color when it remains readable.

## Accessibility check

Before finishing, inspect the theme with:

- long comments and low-contrast text
- selected text and search matches
- diagnostics on both editor and panel surfaces
- inactive and active tabs
- terminal ANSI output
- light and dark content behind translucent surfaces

Use a contrast checker when exact accessibility requirements apply. Visual inspection alone is not enough for strict accessibility targets.
