# tsm - tmux session manager

A minimal, keyboard-driven tmux session manager for dmenu-like launchers (wofi/rofi/dmenu/fzf).

## Features

- **Quick access** via wofi/rofi/dmenu/fzf
- **Create sessions** with custom names
- **Recent sessions** - last 10 active sessions
- **Instant attach** - select and connect

## Requirements

- Bash 4+
- tmux
- One of: `wofi`, `rofi`, `dmenu`, or `fzf`
- A terminal emulator (kitty, foot, alacritty, etc.)
- Optional: `notify-send` for notifications

## Installation

```bash
git clone https://github.com/universal-abstraction/tsm.git
cd tsm
make install
```

This installs `tsm` to `~/.local/bin/` (ensure it's in your `$PATH`).

## Quick Start

Bind `tsm` to a hotkey in your window manager:

**Hyprland:**
```
bind = SUPER, T, exec, tsm
```

**Sway:**
```
bindsym $mod+t exec tsm
```

**i3:**
```
bindsym $mod+t exec --no-startup-id tsm
```

Press the hotkey and select:
- **New Session** - Create a new tmux session
- **[session name]** - Attach to existing session

## Configuration

Configuration file is automatically created on first run at:
```
~/.config/tsm/config
```

```bash
# Terminal emulator
TERMINAL="kitty"

# Menu launcher (wofi, rofi, dmenu, fzf)
MENU_LAUNCHER="wofi"

# Number of sessions to show
RECENT_SESSIONS_COUNT="10"
```

## Uninstall

```bash
make uninstall
rm -rf ~/.config/tsm  # optional: remove config
```

## License

MIT
