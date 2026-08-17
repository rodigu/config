---
name: zed-theming
description: Creates, adapts, and validates Zed editor themes. Use when building a new theme, modifying an existing theme, translating a theme from another editor, adding light/dark or blurred variants, or debugging Zed theme JSON.
---

# Zed theme development

Use this skill for general Zed theme work. Do not assume a particular theme name, file path, appearance, palette, or visual style.

Read the relevant references before making substantial changes:

- [Theme format](references/theme-format.md)
- [Style keys](references/style-keys.md)
- [Color design](references/color-design.md)
- [Examples and source references](references/examples.md)

## Workflow

1. Read project instructions and identify the requested target file or theme collection.
2. Read the existing theme before editing it. If creating a theme, inspect one or more complete Zed themes for structure.
3. Check the project's documented palette or design constraints. If none exists, define a coherent palette by semantic role before assigning colors.
4. Decide whether the result is a single theme or a collection containing light, dark, blurred, or other variants.
5. Preserve the theme schema, names, non-color settings, syntax scope structure, and existing behavior unless the request calls for a structural change.
6. Assign colors by role: surfaces, text, borders, focus, selections, diagnostics, version control, syntax, terminal, and collaboration.
7. Use transparency deliberately. For blurred themes, make the relevant background and overlay surfaces translucent and set `background.appearance` to `blurred`.
8. Keep the file strict JSON. Do not add comments, trailing commas, CSS variables, or unsupported keys.
9. Validate the result and inspect the diff. Report the exact file changed and validation performed.

## General rules

- Zed theme files use literal color values. They do not resolve CSS variables or named palette variables.
- Use six-digit `#RRGGBB` colors for opaque values and eight-digit `#RRGGBBAA` colors when alpha is needed.
- Keep text readable against every surface. Use lighter colors for foregrounds on dark surfaces and darker colors for foregrounds on light surfaces.
- Pair semantic fields consistently. For example, `error`, `error.background`, and `error.border` should communicate the same state.
- Do not use a single accent for every purpose if it makes focus, links, selections, diagnostics, and syntax indistinguishable.
- Preserve enough distinction between terminal ANSI colors for command-line applications, even in a restrained or monochrome theme.
- Use existing theme files and the current Zed schema as references. The available fields evolve over time, so do not invent large groups of keys without checking a current example.
- Do not change the user's Zed settings merely to create a theme. Update settings only when explicitly requested.

## Validation

For a theme file at `<theme-file>`:

```bash
python -m json.tool <theme-file> >/dev/null
```

Then check that:

- The `$schema` points to a Zed theme schema.
- The top-level `themes` value is an array.
- Each entry has a unique `name`, an `appearance`, and a `style` object.
- All colors are valid six- or eight-digit hex values, or valid values already supported by the target schema.
- No colors violate project-specific palette instructions.
- A blurred theme has the required appearance setting and translucent surfaces where blur should show through.
- The theme file contains no stale colors from the previous design.

Use the references for the full structure, style-key groups, design guidance, and local examples.