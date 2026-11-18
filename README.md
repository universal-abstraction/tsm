# tsm — tmux session manager

[![shellcheck](https://github.com/universal-abstraction/tsm/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/universal-abstraction/tsm/actions/workflows/shellcheck.yml)

A small Bash script that lists your tmux sessions in a dmenu-style launcher
(wofi, rofi, dmenu or fzf) and opens the one you pick in a new terminal window.

## Features

- Pick a session from wofi, rofi, dmenu or fzf.
- Sessions are listed by last activity, most recent first.
- Create a new session from the same menu. If a session with that name
  already exists, tsm opens it instead.
- Names are matched exactly: picking `dev` never opens `development`.

## Requirements

- Bash 4+
- tmux
- One of: `wofi`, `rofi`, `dmenu`, or `fzf`
- A terminal emulator (foot, kitty, alacritty, ...)
- Optional: `notify-send` for notifications

## Installation

```bash
git clone https://github.com/universal-abstraction/tsm.git
cd tsm
make install
```

This copies `tsm` to `~/.local/bin/`; make sure that directory is in your
`$PATH`. To install somewhere else, set `PREFIX`:

```bash
make install PREFIX=/usr/local
```

## Usage

Bind `tsm` to a key in your window manager:

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

The menu shows:
- **New Session** — asks for a name, creates the session and opens it.
- **[session name]** — opens an existing session.

With `MENU_LAUNCHER="fzf"`, run `tsm` from a terminal: fzf needs one to draw
the menu. The chosen session still opens in a new terminal window.

## Configuration

On first run tsm creates `~/.config/tsm/config` (or
`$XDG_CONFIG_HOME/tsm/config`) with every option commented out. Uncomment a
line to change it:

```bash
# Terminal emulator command. tsm appends "tmux attach-session -t <name>".
TERMINAL="foot"

# Menu launcher: wofi, rofi, dmenu, or fzf
MENU_LAUNCHER="wofi"

# Number of sessions to show in the menu
RECENT_SESSIONS_COUNT="10"
```

The values above are the defaults. If `TERMINAL` is already set in your
environment and the config does not override it, tsm uses that value.

Some terminals need a flag before the command to run. Include it in
`TERMINAL`, for example `TERMINAL="alacritty -e"` or
`TERMINAL="gnome-terminal --"`.

## Uninstall

```bash
make uninstall
```

To also remove the configuration:

```bash
rm -rf ~/.config/tsm
```

## License

MIT, see [LICENSE](LICENSE).
