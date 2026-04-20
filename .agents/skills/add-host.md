# Skill: add-host

## Read first

`.agents/context/architecture.md` — if not already read this session.

## What this touches

`flake.nix`, `parts/nixos.nix`, `hosts/<new>/default.nix`,
`users/<username>/default.nix`, `users/<username>/<new>.nix`.
This is a structural change — ask for review before committing.

## Steps

### 1. Decide GPU and CPU context

Confirm with the user:
- Hostname
- GPU vendor (`amd` or `nvidia`)
- Any hardware-specific notes (e.g. hybrid graphics, unusual peripherals)

### 2. Create host directory

```
hosts/<hostname>/
└── default.nix
```

Do not create `hardware.nix` — it will be generated on the target machine
and copied by `install.sh`.

### 3. Scaffold default.nix

Minimum viable structure:

```nix
{ inputs, lib, pkgs, ... }:
{
  imports = [
    ./hardware.nix                        # not in repo, generated on machine
    ../modules/nixos/base.nix
    ../modules/nixos/network.nix
    ../modules/nixos/audio.nix
    ../modules/nixos/niri.nix
    ../modules/nixos/sddm.nix
    ../modules/nixos/gpu/<vendor>.nix     # amd or nvidia
    
    ../modules/nixos/features/flatpak.nix
    ../modules/nixos/features/docker.nix
  ];

  networking.hostName = "<hostname>";

  # host-specific options go here, not in modules
}
```

### 4. Add display configuration

Create `users/<username>/<hostname>.nix` with display-specific overrides:
niri output config, waybar dimensions, fuzzel sizing, scaling factor.
Do not put these values in shared modules.

### 5. Wire into flake-parts

In `parts/nixos.nix`, add the new host to `nixosConfigurations`.
Follow the exact pattern used by existing hosts — do not invent new structure.

### 6. Wire Home Manager user

In `users/<username>/default.nix`, ensure the new host file is conditionally
or unconditionally imported as appropriate for the user's setup.

### 7. Update install.sh

Add the new hostname to the list of valid hostname choices in the prompt.

### 8. Verify

```bash
just build <hostname>
just check
```

Both must pass before committing.

### 9. Update docs

Add the new host to the table in both `docs/English/overview.md`
and `docs/Russian/overview.md`.

### 10. Commit

This is a structural change. Present a summary and wait for confirmation.

```
feat(hosts): add <hostname> host
```
