# Zed theme format

Zed themes are JSON files with a theme collection at the top level. A minimal theme has this shape:

```json
{
  "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
  "name": "Example Themes",
  "author": "Author",
  "themes": [
    {
      "name": "Example Dark",
      "appearance": "dark",
      "style": {
        "background": "#202020",
        "text": "#f0f0f0",
        "editor.background": "#202020",
        "editor.foreground": "#f0f0f0"
      }
    }
  ]
}
```

## Top-level fields

- `$schema`: editor/schema reference. Keep the version used by the target Zed installation or existing theme.
- `name`: collection name shown when the theme file is installed.
- `author`: optional attribution.
- `themes`: array of one or more theme definitions.

Each theme definition normally contains:

- `name`: the selectable theme name.
- `appearance`: `light` or `dark`.
- `style`: an object containing Zed UI, editor, syntax, terminal, and state colors.

Theme names should be unique within a collection. A single file can provide related variants, for example `Example Light`, `Example Dark`, and `Example Dark (blur)`.

## Style values

Most style colors are strings such as `#RRGGBB` or `#RRGGBBAA`. Eight-digit hex uses the final two digits as alpha. Examples:

```json
{
  "background": "#202020",
  "element.selected": "#ffffff26",
  "border.transparent": "#ffffff00"
}
```

Some fields can be `null`, which lets Zed fall back to its default behavior. Preserve `null` when adapting a theme unless the requested design needs an explicit value.

The `accents` field is an optional array of colors used by Zed for accent selection and related UI behavior:

```json
"accents": ["#4f8cc9", "#d05b63", "#61a875"]
```

## Blur

A blurred theme uses the style field:

```json
"background.appearance": "blurred"
```

The main background and surfaces should generally use alpha values so the compositor can show the blurred desktop behind them. Editor, gutter, and terminal backgrounds may also need transparent values. Compare a complete blurred theme rather than changing only the appearance field.

## Syntax objects

Syntax scopes are nested under `style.syntax`. The simplest form is:

```json
"syntax": {
  "comment": {"color": "#737373", "font_style": "italic"},
  "keyword": {"color": "#b34d5c"},
  "string": {"color": "#4d8c67"}
}
```

A scope can include `color`, `font_style`, and `font_weight`. Keep the existing scope names when adapting a theme. More specific scopes can refine broader scopes, so use the current schema and complete examples as references.

## Strict JSON

Theme files are JSON, not JSONC. Do not leave comments or trailing commas. Validate every generated file with a JSON parser before using it in Zed.

## References

- Zed theme schema: <https://zed.dev/schema/themes/v0.2.0.json>
- Zed documentation: <https://zed.dev/docs/themes>
