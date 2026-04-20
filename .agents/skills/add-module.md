# Skill: add-module

## Read first

`.agents/context/modules.md` — if not already read this session.

## Determine module type

| Type | Location | Scope |
|------|----------|-------|
| NixOS module | `modules/nixos/<name>.nix` | System-level, requires root |
| Home module | `modules/home/<name>.nix` | User-level, Home Manager |

If unsure: does it configure a system service, driver, or package available to all users?
→ NixOS. Does it configure a user application or dotfile? → Home.

## NixOS module

### Scaffold

```nix
{ config, lib, pkgs, ... }:
{
  # imports here only if genuinely needed

  # options — only if this module exposes tuneable behaviour
  # options.modules.<name>.enable = lib.mkEnableOption "<description>";

  # config
}
```

### Rules

- One concern only. If it grows two unrelated concerns, split it.
- No hostname conditionals. Host-specific values belong in `hosts/<n>/default.nix`.
- GPU-specific variables belong in `gpu/amd.nix` or `gpu/nvidia.nix` — not here.
- Do not add packages to `environment.systemPackages` unless they are
  genuinely required by this module's function. General utilities go in `base.nix`.

### Wire it

Import in the relevant `hosts/<n>/default.nix`.
If it applies to all hosts, import in all host files individually —
do not create a "shared imports" list that couples hosts together.

## Home module

### Scaffold

```nix
{ config, lib, pkgs, ... }:
{
  # Link config file from config/ if the app has one:
  # xdg.configFile."<app>/<file>".source = ../../config/<file>;

  # Or use programs.<app> if HM has a module for it
}
```

### Rules

- Prefer `xdg.configFile` for linking plain files from `config/`.
- Prefer `programs.<app>` when HM has a module and it covers the need cleanly.
- Do not inline config file contents as Nix strings — keep them in `config/`.
- Display-specific values (sizes, positions, scaling) go in
  `users/<username>/laptop.nix` or `users/<username>/desktop.nix`, not here.

### Wire it

Import in `users/<username>/default.nix`.

## After creating the module

```bash
nix build .#nixosConfigurations.laptop.config.system.build.toplevel
nix build .#nixosConfigurations.desktop.config.system.build.toplevel
nix flake check
nix fmt
```

All must pass.

## Commit

Single-module addition: commit directly, no review needed.

```
feat(<name>): add <name> module
```
