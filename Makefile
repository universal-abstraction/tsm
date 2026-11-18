PREFIX ?= $(HOME)/.local
BINDIR = $(PREFIX)/bin

.PHONY: all install uninstall lint help

all: help

help:
	@echo "tsm - a minimal tmux session manager"
	@echo ""
	@echo "Usage:"
	@echo "  make install    - Install tsm to $(BINDIR)"
	@echo "  make uninstall  - Remove $(BINDIR)/tsm"
	@echo "  make lint       - Run shellcheck"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX          - Installation prefix (default: ~/.local)"

install:
	@echo "Installing tsm..."
	@mkdir -p $(BINDIR)
	@install -m 755 tsm $(BINDIR)/tsm
	@echo ""
	@echo "✓ Installed to $(BINDIR)/tsm"
	@echo ""
	@echo "Configuration will be created on first run at:"
	@echo "  ~/.config/tsm/config"
	@echo ""
	@echo "Add to your window manager config:"
	@echo "  Hyprland:  bind = SUPER, T, exec, tsm"
	@echo "  Sway:      bindsym \$$mod+t exec tsm"
	@echo "  i3:        bindsym \$$mod+t exec --no-startup-id tsm"
	@echo ""
	@echo "Run 'tsm --help' for more information"

uninstall:
	@echo "Uninstalling tsm..."
	@rm -f $(BINDIR)/tsm
	@echo "Removed $(BINDIR)/tsm"
	@echo ""
	@echo "Note: configuration at ~/.config/tsm/ was preserved"
	@echo "To remove it: rm -rf ~/.config/tsm"

lint:
	shellcheck tsm
