# Architecture

## What this repo is

NixOS flake using flake-parts. Two hosts. Home Manager as a NixOS module.
One-click install for other users is a first-class requirement.
Complexity is a cost — earn it or don't introduce it.

## Layout

```
dotfiles/
├── flake.nix                  # Entry point.
├── flake.lock                 # Never edit manually.
├── install.sh                 # One-click installer.
├── settings.nix               # Global settings
├── parts/
│   └── nixos.nix              # nixosConfigurations via flake-parts
├── hosts/
│   ├── wsl/
│   │   ├── default.nix        # WSL Host assembly
│   │   ├── flake.nix          # WSL-specific flake
│   │   └── flake.lock         # Never edit manually
│   ├── laptop/
│   │   ├── default.nix        # Host assembly
│   │   └── hardware.nix       # NOT IN REPO — generated on target machine
│   └── desktop/
│       ├── default.nix        # Host assembly
│       └── hardware.nix       # NOT IN REPO — generated on target machine
├── modules/
│   ├── nixos/                 # System-level modules (require root)
│   │   ├── base.nix
│   │   ├── nix.nix            # Nix features
│   │   ├── boot.nix
│   │   ├── network.nix
│   │   ├── audio.nix
│   │   ├── locale.nix
│   │   ├── niri.nix
│   │   ├── sddm.nix
│   │   ├── features/          # Optional System-level modules
│   │   │   ├── docker.nix
│   │   │   └── flatpak.nix
│   │   └── gpu/
│   │       ├── amd.nix
│   │       └── nvidia.nix
│   └── home/                  # User-level modules (Home Manager)
│       ├── base.nix
│       ├── zsh.nix
│       ├── alacritty.nix
│       ├── firefox.nix
│       ├── waybar.nix
│       └── fuzzel.nix
├── config/                    # Raw dotfiles — plain files, not Nix attrsets
│   ├── starship.toml
│   ├── alacritty.toml
│   ├── waybar/
│   │   ├── config.jsonc
│   │   └── style.css
│   └── niri/
│       └── config.kdl
├── users/
│   └── <username>/
│       ├── default.nix        # HM entry point for this user
│       ├── laptop.nix         # Laptop-specific HM overrides
│       ├── desktop.nix        # Desktop-specific HM overrides
│       └── wsl.nix            # WSL-specific HM overrides
└── docs/                      # User-related documents, organized into clear categories
    ├── English/*
    └── Russian/*
```

If necessary, use the `tree` for optimal navigation through the file structure.

## Boundaries

**`modules/nixos/`** — anything that requires root or affects the system:
drivers, services, kernel, session, fonts, base packages.

**`modules/home/`** — anything that belongs to the user:
app configs, dotfile links, shell, environment variables.

**`hosts/`** — assembly point for a machine. Imports modules, sets host-specific
options. No logic lives here, only wiring (Exception: WSL environment).

**`users/`** — assembly point for a user on a specific host. Host-specific HM
overrides (scaling, monitor layout) live in `laptop.nix` / `desktop.nix` / `wsl.nix`.

**`config/`** — plain dotfiles. Linked by home modules via `xdg.configFile`.
Edit these without touching Nix. Do not convert to Nix attrsets without reason.

## Hard constraints

- `hardware.nix` is never in this repo. See modules.md.
- No hostname conditionals inside modules. Ever.
- No cross-host imports. Hosts are independent.
- GPU modules are mutually exclusive by import, not by condition.
- `nixpkgs.config.allowUnfree = true` is global and intentional. Do not touch it.

## Hosts

| Hostname | Machine | CPU | GPU |
|----------|---------|-----|-----|
| `laptop` | Honor MagicBook X16 Plus 2024 | Ryzen 7 8845HS | Radeon 890M (iGPU) |
| `desktop` | Custom | Ryzen 5 7500F | RTX 4070 Super |
| `wsl` | WSL-2 | Unknown | Unknown |