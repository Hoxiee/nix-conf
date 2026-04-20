# NixOS Configuration Management
# Run `just --list` to see all available commands

# Default recipe - show help
default:
    @just --list

# ============================================================================
# WSL Commands (MUST be run from hosts/wsl/)
# ============================================================================

# Check WSL configuration (WSL only)
wsl-check:
    cd hosts/wsl && nix flake check --show-trace

# Build WSL configuration (WSL only)
wsl-build:
    cd hosts/wsl && nix build .#nixosConfigurations.wsl.config.system.build.toplevel

# Apply WSL configuration (WSL only)
wsl-switch:
    cd hosts/wsl && sudo nixos-rebuild switch --flake .#wsl

# ============================================================================
# Host Commands (laptop/desktop)
# ============================================================================

# Check all configurations
check:
    nix flake check --show-trace

# Build configuration for specific host
build hostname:
    nix build .#nixosConfigurations.{{hostname}}.config.system.build.toplevel

# Apply configuration for specific host
switch hostname:
    sudo nixos-rebuild switch --flake .#{{hostname}}

# ============================================================================
# Update Commands
# ============================================================================

# Update all flake inputs
update:
    nix flake update

# Update specific flake input
update-input input:
    nix flake update {{input}}

# ============================================================================
# Formatting
# ============================================================================

# Format all Nix files
fmt:
    nix fmt

# ============================================================================
# Pre-commit Checklist
# ============================================================================

# Run full pre-commit checklist
pre-commit: check fmt
    @echo "✓ Pre-commit checklist passed"
    @echo "  - nix flake check: OK"
    @echo "  - nix fmt: OK"
    @echo ""
    @echo "Next steps:"
    @echo "  1. Review changes with git diff"
    @echo "  2. Commit with conventional commits"
    @echo "  3. Update docs/ if structure changed"

# ============================================================================
# Development Helpers
# ============================================================================

# Show current git status
status:
    git status

# Show git diff
diff:
    git diff

# Show git log (last 10 commits)
log:
    git log --oneline -10

# ============================================================================
# Installation
# ============================================================================

# Run installer on new machine
install:
    bash install.sh
