# WSL Testing Workflow

This file defines the ONLY valid way to test configuration when working inside WSL.

---

## Environment detection

You are in WSL if ANY of the following is true:

* /proc/version contains "Microsoft"
* uname -r contains "WSL"
* /run/WSL exists

If unsure — assume WSL.

---

## Working directory

All commands MUST be executed from repository root using `just`.

NEVER run any flake command directly in WSL. Always use `just`.

---

## Allowed commands

### 1. Validate flake

just wsl-check

---

### 2. Build configuration

just wsl-build

---

### 3. Apply configuration

just wsl-switch

---

## Forbidden actions

* Running `nix flake check` directly (use `just wsl-check`)
* Running `nixos-rebuild` directly (use `just wsl-switch`)
* Running any flake command from repository root without `just`
* Importing Home Manager modules into NixOS layer
* Mixing system and home modules

---

## Failure handling

If any step fails:

1. STOP immediately
2. DO NOT attempt random fixes
3. Inspect the error
4. Fix the root cause
5. Re-run from step 1

---

## Notes

* WSL uses its own flake entrypoint
* Root flake is NOT valid for WSL testing
* Always treat WSL as a separate deployment target
* Use `just` for all commands to avoid mistakes
