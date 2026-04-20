# Workflow

## Deploy

```bash
# New machine — run once
just install

# Full rebuild (system + Home Manager)
just switch <hostname>

# Build without applying
just build <hostname>

# Update all flake inputs
just update

# Update single input
just update-input <input>
```

Valid hostnames: `laptop`, `desktop`.

## install.sh rules

Bash only. Under 100 lines. Idempotent.

Does exactly:
1. Copy `hardware-configuration.nix` from `/etc/nixos/` into `hosts/<n>/`
2. Prompt: username, hostname, GPU vendor (`amd` or `nvidia`)
3. Write collected values into host config
4. Run `nixos-rebuild switch --flake .#<hostname>`

Every prompt has a visible default. No silent auto-detection.

## Git — commit style

Conventional Commits. Short and factual. No body unless genuinely non-obvious.

```
feat(sddm): add SilentSDDM theme module
fix(nvidia): correct GBM_BACKEND variable name
chore(flake): update nixpkgs input
docs: sync Russian overview after layout change
refactor(docker): switch default to rootless
```

Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `style`.
Scope = affected module or area: `(niri)`, `(zsh)`, `(flake)`, `(laptop)`, etc.

## Git — amend policy

Use `--amend` for:
- Small corrections to the previous commit
- Iterative rewrites within one logical change
- Keeping exploratory noise out of history

Do not amend pushed commits.

## Git — when to ask for review before committing

Stop and ask if the change touches:
- `flake.nix` or `parts/`
- `install.sh`
- Any module imported by both hosts

For isolated single-module or config file changes: commit directly.
Summary: two or three sentences, what changed and why.

## Pre-commit checklist

```bash
just pre-commit
```

This runs:
1. `just check` — no errors
2. `just fmt` — no diff

Manual steps:
3. Both `docs/` overviews updated if structure changed

## Documentation

`docs/English/overview.md` and `docs/Russian/overview.md` stay in sync.

Each file: one-sentence description, host table, module summary paragraph,
installer commands. Max 60 lines. No filler.
Update both whenever structure changes.

## Justfile

All commands MUST use `just` to avoid mistakes.

Common commands:
- `just --list` — show all available commands
- `just check` — check all configurations
- `just wsl-check` — check WSL configuration (WSL only)
- `just build <hostname>` — build configuration
- `just switch <hostname>` — apply configuration
- `just fmt` — format all Nix files
- `just pre-commit` — run pre-commit checklist