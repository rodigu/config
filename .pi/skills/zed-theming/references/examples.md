# Zed theme examples and source references

Use complete installed themes to learn structure, not to copy their color choices blindly.

## Local examples

These paths are useful when they exist on the machine:

- Fleet themes: `~/.local/share/zed/extensions/installed/fleet-themes/themes/fleet.json`
  - Contains `Fleet Light`, `Fleet Dark Purple`, and `Fleet Dark`.
  - Useful for a compact light/dark UI structure, semantic states, terminal ANSI colors, players, and syntax scopes.
- Everforest blur: `~/.local/share/zed/extensions/installed/everforest/themes/everforest-blur.json`
  - Useful for `background.appearance: "blurred"`, translucent editor surfaces, and alpha variants.
- Everforest material: `~/.local/share/zed/extensions/installed/everforest/themes/everforest-material.json`
  - Useful for a comparable opaque dark variant.
- Tokyo Night: `~/.local/share/zed/extensions/installed/tokyo-night/themes/tokyo-night.json`
  - Useful for nullable fields, optional panel keys, alpha accents, and a broad syntax map.

Find theme definitions and names with:

```bash
rg -n '"name"|"appearance"|"background.appearance"' ~/.local/share/zed/extensions/installed --glob '*.json'
```

Read a complete definition, not only its first lines. Theme files often contain multiple variants and long syntax sections.

## Official references

- Zed theme documentation: <https://zed.dev/docs/themes>
- Zed theme schema used by current examples: <https://zed.dev/schema/themes/v0.2.0.json>
- Zed configuration documentation: <https://zed.dev/docs/configuring-zed>

## Comparing themes

When adapting another theme:

1. Identify the source theme's top-level collection and target theme entry.
2. Preserve the field structure that Zed and the source theme already use.
3. Translate roles in groups: surfaces, text, editor, states, syntax, terminal, and players.
4. Translate alpha separately from the RGB color when preserving transparency.
5. Validate JSON and search for source colors that should no longer remain.

## Testing in Zed

After placing a theme in a directory Zed scans, select it through the theme picker or configure it in Zed settings. If the theme does not appear, check the file's JSON syntax, collection structure, unique theme name, and whether the directory is included in Zed's theme discovery path. Reload or restart Zed if the picker has cached the previous theme list.
