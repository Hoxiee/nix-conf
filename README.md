# NixOS Configuration

Reproducible NixOS configuration for multiple hosts using flakes, flake-parts, and Home Manager.

## Features

- **Multiple hosts**: laptop (AMD) + desktop (NVIDIA) + WSL
- **Wayland**: Niri compositor + SilentSDDM
- **Home Manager**: Integrated as NixOS module
- **One-click install**: Ready for fresh NixOS installations
- **Modular**: Clean separation between system and user configs

## Quick Start

```bash
# Clone repo
git clone <repo-url> /etc/nixos
cd /etc/nixos

# Run installer
bash install.sh
```

## Structure

```
dotfiles/
├── flake.nix              # Entry point
├── install.sh             # One-click installer
├── settings.nix           # Global settings
├── hosts/                 # Machine-specific configs
├── modules/               # Reusable modules
│   ├── nixos/            # System-level
│   └── home/             # User-level
├── config/               # Raw dotfiles
└── users/                # User-specific HM configs
```

## Hosts

| Hostname | CPU | GPU |
|----------|-----|-----|
| `laptop` | Ryzen 7 8845HS | Radeon 890M |
| `desktop` | Ryzen 5 7500F | RTX 4070 Super |
| `wsl` | Unknown | Unknown |

## Commands

```bash
just --list          # Show all commands
just check           # Check all configs
just build <host>    # Build configuration
just switch <host>   # Apply configuration
just fmt             # Format Nix files
```

## Documentation

- [Architecture](.agents/context/architecture.md) - System design
- [Modules](.agents/context/modules.md) - Module guidelines
- [Conventions](.agents/context/conventions.md) - Code style
- [Workflow](.agents/context/workflow.md) - Git & deployment

## License

MIT
