# Eww Bar

A Hyprland status bar built with [Eww](https://elkowar.github.io/eww/), adapted from [saimoomedits/eww-widgets](https://github.com/saimoomedits/eww-widgets).

## Layout

```
┌─ LEFT ─────────┬─ CENTER ──────────────────┬─ RIGHT ────────────────────┐
│ App Launcher    │ Volume | Clock | Weather  │ CPU | Mem | Disk | Tray    │
│ Workspaces      │                          │                            │
└─────────────────┴──────────────────────────┴────────────────────────────┘
```

## Widgets

| Widget | Description |
|--------|-------------|
| **App Launcher** | Favourites + searchable app list |
| **Workspaces** | Hyprland workspace indicator (1-10) |
| **Volume** | Scroll to adjust, click to mute |
| **Clock** | Click for calendar popup |
| **Weather** | Click for 5-day forecast popup |
| **CPU / Mem / Disk** | Live percentage readouts |
| **System Tray** | GTK systray |
| **Music** | Playerctl-based, hover for controls |
| **Brightness** | Hover to reveal slider |
| **WiFi** | Hover to show ESSID |
| **Battery** | Circular progress indicator |

## Requirements

- `eww` - Elkowar's Wacky Widgets
- `hyprland` - Window manager
- `jq` - JSON parsing
- `socat` - Hyprland IPC
- `pamixer` - Volume control
- `brightnessctl` - Brightness control
- `playerctl` - Media control
- `wttrbar` - Weather data

## Quick Start

```bash
# Toggle bar on/off
./launch_bar

# Or manually:
eww daemon &
eww open bar
```

## Development

```bash
# After editing eww.yuck or eww.scss:
eww reload

# Check for syntax errors:
eww check

# View runtime errors:
eww logs

# Test individual scripts:
./scripts/weather
./scripts/cpu
./scripts/memory
```

### Configuration

- **Monitor**: Change `(defvar monitor "DP-1")` in `eww.yuck` line 2
- **Colors/Theme**: Edit `eww.scss`
- **Scripts**: Edit files in `scripts/`

## File Structure

```
├── eww.yuck          Widget definitions
├── eww.scss          Styles and theming
├── launch_bar        Toggle script (start/stop)
├── flake.nix         Nix flake (devShell + home-manager module)
├── scripts/          Helper scripts
│   ├── workspace     Hyprland workspace listener
│   ├── weather       Weather fetcher (wttrbar)
│   ├── cpu           CPU usage
│   ├── disk          Disk usage
│   ├── memory        Memory usage
│   └── ...
└── images/           SVGs and icons
```

## Nix

Enter a dev shell with all dependencies:

```bash
nix develop
```

The flake also exports a `homeManagerModules.default` module for home-manager integration.

## Credits

Original design by [saimoomedits](https://github.com/saimoomedits/eww-widgets).
