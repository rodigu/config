# Zed style-key guide

Zed theme styles are organized by semantic areas. A theme does not need every possible key. Start with the keys present in a complete current theme, then add only the fields needed by the design.

## UI surfaces and controls

Common groups:

- `background`: application background.
- `surface.background`: ordinary surfaces.
- `elevated_surface.background`: elevated dialogs, menus, and popovers.
- `element.background`, `element.hover`, `element.active`, `element.selected`, `element.disabled`: controls and list items.
- `ghost_element.*`: low-emphasis controls.
- `drop_target.background`: drag-and-drop target.
- `panel.background`, `panel.overlay_background`: side panels and overlays.
- `toolbar.background`, `status_bar.background`, `title_bar.background`, `title_bar.inactive_background`: chrome.
- `tab_bar.background`, `tab.active_background`, `tab.inactive_background`: tabs.

## Text and icons

- `text`, `text.muted`, `text.placeholder`, `text.disabled`, `text.accent`.
- `icon`, `icon.muted`, `icon.placeholder`, `icon.disabled`, `icon.accent`.
- `link_text.hover`.

Keep the text hierarchy readable. Disabled and placeholder text should be lower contrast than primary text but still visible.

## Borders and guides

- `border`, `border.variant`, `border.focused`, `border.selected`, `border.disabled`, `border.transparent`.
- `pane_group.border`, `pane.focused_border`, `panel.focused_border`.
- `panel.indent_guide`, `panel.indent_guide_active`, `panel.indent_guide_hover`.
- `scrollbar.thumb.background`, `scrollbar.thumb.hover_background`, `scrollbar.thumb.border`.
- `scrollbar.track.background`, `scrollbar.track.border`.

Use focus and selection colors consistently across panes, panels, and controls.

## Editor

Common editor keys include:

- `editor.background`, `editor.foreground`, `editor.gutter.background`.
- `editor.subheader.background`.
- `editor.active_line.background`, `editor.highlighted_line.background`.
- `editor.line_number`, `editor.active_line_number`, `editor.hover_line_number`.
- `editor.indent_guide`, `editor.indent_guide_active`.
- `editor.wrap_guide`, `editor.active_wrap_guide`.
- `editor.invisible`.
- `editor.document_highlight.read_background`, `editor.document_highlight.write_background`, `editor.document_highlight.bracket_background`.
- `search.match_background`.

Active-line and guide backgrounds usually work best with low alpha so they do not overpower source text.

## Diagnostics and file states

For each state, define a foreground and, where useful, a background and border:

- `error`, `error.background`, `error.border`.
- `warning`, `warning.background`, `warning.border`.
- `info`, `info.background`, `info.border`.
- `hint`, `hint.background`, `hint.border`.
- `success`, `success.background`, `success.border`.
- `conflict.*`, `created.*`, `deleted.*`, `modified.*`, `renamed.*`, `unreachable.*`.
- `hidden.*`, `ignored.*`, `predictive.*`.

Use the same semantic mapping in diagnostics, notifications, and version-control states instead of assigning unrelated colors to similar statuses.

## Version control

Many themes define:

```json
"version_control.added": "#...",
"version_control.modified": "#...",
"version_control.deleted": "#..."
```

These should remain distinguishable in the editor and file tree. If a palette is monochrome, vary lightness, borders, or background alpha while keeping the states readable.

## Terminal

Define terminal foreground/background and the ANSI colors when the theme includes terminal styling:

- `terminal.background`, `terminal.foreground`, `terminal.bright_foreground`, `terminal.dim_foreground`.
- `terminal.ansi.background`.
- `terminal.ansi.black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`.
- `terminal.ansi.bright_*` and `terminal.ansi.dim_*` variants.

Terminal applications depend on these slots. A palette may reinterpret them, but normal and bright variants should not collapse into unreadable identical colors.

## Syntax

Common syntax scopes include:

- `attribute`, `boolean`, `comment`, `comment.doc`, `constant`, `constant.builtin`.
- `constructor`, `enum`, `function`, `function.builtin`, `function.definition`, `function.special`.
- `keyword`, `label`, `namespace`, `number`, `operator`, `preproc`, `property`, `type`, `variant`.
- `string`, `string.escape`, `string.regex`, `string.special`, `string.special.symbol`.
- `tag`, `tag.doctype`, `text.literal`, `title`, `variable`, `variable.special`.
- `punctuation` and its nested forms.

These scopes vary between themes and Zed versions. Preserve scopes from the source theme when translating one, and consult a complete current theme before creating a large syntax map.

## Collaboration

The optional `players` array supplies collaborator cursor and selection colors:

```json
"players": [
  {
    "cursor": "#f0f0f0",
    "background": "#303030",
    "selection": "#4f8cc966"
  }
]
```

Provide enough contrast between collaborators without violating the theme's palette or accessibility goals.

## Evolving fields

Zed adds and changes theme keys over time. The schema URL, installed themes, and current Zed documentation are more reliable than an old static list. Unknown keys should not be invented to fill gaps; use a current example and verify the result in Zed.
