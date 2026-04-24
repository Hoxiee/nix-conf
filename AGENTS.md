# AGENTS.md

NixOS configuration for two hosts (laptop + desktop) using flakes, flake-parts,
niri (Wayland), SDDM + SilentSDDM, and Home Manager as a NixOS module.
Designed for reproducibility and one-click deployment by other users.

---

## Before you do anything

Read `.agents/context/architecture.md` first.
It is short. Everything else depends on it.

---

## Environment detection (CRITICAL)

You MUST detect the runtime environment before executing any command.

If you are inside WSL:

* You MUST use `just wsl-check` instead of `nix flake check`
* You MUST follow `.agents/workflows/testing-wsl.md`

Direct link:
.agents/workflows/testing-wsl.md

NEVER run nix flake check or nixos-rebuild from the repository root in WSL.

Doing so is considered a critical error.

---

## Justfile (REQUIRED)

All commands MUST use `just` to avoid mistakes.

Common commands:
- `just --list` — show all available commands
- `just check` — check all configurations
- `just wsl-check` — check WSL configuration (WSL only)
- `just build <hostname>` — build configuration
- `just switch <hostname>` — apply configuration
- `just fmt` — format all Nix files
- `just pre-commit` — run pre-commit checklist

**Important:** Only run checks after making real changes. Do not run `just check` repeatedly without modifying code.

NEVER run nix commands directly. Always use `just`.

---

## Context files

Read when the task touches that area.

| File | Read when |
|------|-----------|
| `.agents/context/architecture.md` | Always — before any change |
| `.agents/context/modules.md` | Creating or editing any module |
| `.agents/context/workflow.md` | Git operations, deploy, install.sh |
| `.agents/context/conventions.md` | Formatting, naming, style questions |

---

## Skills

Read the matching skill file before starting the task.

| Trigger | File |
|---------|------|
| Adding a new host | `.agents/skills/add-host.md` |
| Adding a new module (nixos or home) | `.agents/skills/add-module.md` |

---

## Workflows

| Task           | File                               |
| -------------- | ---------------------------------- |
| Testing in WSL | `.agents/workflows/testing-wsl.md` |

---

## Extending this system

New skills → `.agents/skills/<name>.md`, add a row to the table above.
New modes (e.g. caveman, verbose) → `.agents/<name>.md`, document activation in that file.
Context files → `.agents/context/<name>.md`, add a row to the context table above.
Do not put operational detail into this file.
