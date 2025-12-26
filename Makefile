PREFIX ?= $(HOME)/.local
BINDIR = $(PREFIX)/bin

.PHONY: all install uninstall help

all: help

help:
	@echo "tsm - A simple tmux sessions manager"
	@echo ""
	@echo "Usage:"
	@echo "  make install    - Install tsm to ~/.local/bin"
	@echo "  make uninstall  - Remove installed files"
	@echo ""
	@echo "Variables:"
	@echo "  PREFIX          - Installation prefix (default: ~/.local)"

install:
	@echo "Installing tsm..."
	@mkdir -p $(BINDIR)
	@cp tsm $(BINDIR)/tsm
	@chmod +x $(BINDIR)/tsm
	@echo ""
	@echo "✓ Installed to $(BINDIR)/tsm"
	@echo ""
	@echo "Configuration will be created automatically on first run at:"
	@echo "  ~/.config/tsm/config"
	@echo ""
	@echo "Add to your window manager config:"
	@echo "  Hyprland:  bind = SUPER, N, exec, tsm"
	@echo "  Sway:      bindsym \$$mod+n exec tsm"
	@echo "  i3:        bindsym \$$mod+n exec --no-startup-id tsm"
	@echo ""
	@echo "Run 'tsm --help' for more information"
	
uninstall:
	@echo "Uninstalling tsm..."
	@rm -f $(BINDIR)/tsm
	@echo "Removed $(BINDIR)/tsm"
	@echo ""
	@echo "Note: Configuration at ~/.config/tsm/ was preserved"
	@echo "To remove config: rm -rf ~/.config/tsm"
