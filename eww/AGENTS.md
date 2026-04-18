# OpenCode AI Configuration - Agent Guidelines

## Project Overview
This is an **Eww (Elkowar's Wacky Widgets)** configuration repository for a Hyprland status bar. It includes widget definitions (Yuck), styling (SCSS), helper scripts (Bash), and Nix integration.

## Build/Package Commands
```bash
# Install dependencies (uses Nix flake)
nix develop

# No build step required - this is a configuration project
# No test framework configured - widgets are tested through Eww
# No linting/typechecking commands configured
```

## Validation Commands
```bash
# Validate eww configuration syntax
eww check

# Check if daemon is running
eww ping

# View configuration errors
eww logs

# Reload configuration after changes
eww reload
```

## Running Single Components
```bash
# Test individual scripts
./scripts/weather
./scripts/memory
./scripts/battery --bat

# Manual widget testing
eww open <widget_name>    # Open specific widget
eww close <widget_name>   # Close specific widget
eww close-all             # Close all widgets

# Start/stop full bar
./launch_bar              # Toggle bar on/off
./run_eww.sh             # Alternative launcher
```

## Code Style Guidelines

### Yuck Files (*.yuck)
- **Language**: Lisp-like S-expressions
- **Indentation**: 2 spaces, no tabs
- **Naming**: kebab-case for variables/widgets (e.g., `volume-percent`, `clock-module`)
- **Formatting**:
  - Opening paren on same line: `(defwidget name []`
  - Attributes on separate lines with proper indentation
  - Close paren aligned with opening
- **Comments**: `;;` for single line, `;; Block` for sections
- **No trailing spaces**
- **Quote consistency**: Double quotes for strings

### SCSS Files (*.scss)
- **Language**: SCSS/CSS
- **Indentation**: 2 spaces
- **Naming**: kebab-case for classes (e.g., `.volume-icon`, `.clock-time`)
- **Formatting**:
  - Opening brace on same line: `.class {`
  - Properties indented, closing brace on own line
- **Color format**: Hex lowercase with # (e.g., `#0f0f17`)
- **Property order**: Layout, appearance, typography, animation
- **No vendor prefixes** (eww uses GTK/CSS subset)

### Shell Scripts (scripts/*)
- **Language**: Bash
- **Shebang**: `#!/usr/bin/env bash`
- **Naming**: kebab-case for files (e.g., `calendar-ctrl`, `volume-ctrl`)
- **Functions**: camelCase or snake_case, be consistent
- **Variables**: UPPER_CASE for globals, lower_case for locals
- **Error handling**: Always check command results, use `||` for defaults
- **Quote variables**: `"${var}"` to prevent word splitting
- **Use modern bash**: `[[ ]]` for conditionals, `$()` for command substitution

### Nix Files (*.nix)
- **Language**: Nix expression language
- **Indentation**: 2 spaces
- **Naming**: camelCase for variables, kebab-case for options
- **Formatting**: Follow nixfmt style if available
- **String quotes**: Double quotes, use `''` for multi-line

## File Organization
```
├── eww.yuck          # Main widget definitions
├── eww.scss          # Styles and theming
├── launch_bar        # Start/stop script
├── flake.nix         # Nix configuration
├── scripts/          # Helper scripts
│   ├── weather      # Weather fetcher
│   ├── volume-ctrl  # Volume control
│   └── ...
├── images/           # Static assets (SVGs)
└── *.md              # Documentation
```

## Key Patterns

### Defining Variables
```yuck
;; Poll for dynamic values
(defpoll var-name :interval "5s" "command")

;; Static variables
(defvar var-name "value")
```

### Widget Structure
```yuck
(defwidget widget-name []
  (box :class "css-class"
       :orientation "h"
    (child-widgets)))
```

### Script Integration
```yuck
;; Use scripts for complex logic
:onclick "./scripts/script-name arg"
:onchange "command {}"  ; {} replaced with value
```

## Dependencies to Note
- `eww` - Main widget system
- `jq` - JSON parsing (scripts)
- `socat` - Socket communication
- `pamixer` - Volume control
- `brightnessctl` - Brightness control
- `playerctl` - Media control
- `wttrbar` - Weather data

## Error Handling
- Check `eww logs` for runtime errors
- Scripts should fail gracefully with defaults
- Use `2>/dev/null` to suppress expected errors
- Validate with `eww check` before committing

## Testing Approach
1. Run `eww reload` after changes
2. Check `eww logs` for errors
3. Test widgets individually if possible
4. Test on target monitor (DP-1)
5. Verify scripts work standalone: `./scripts/script-name`
