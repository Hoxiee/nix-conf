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

All commands MUST be executed from:

./hosts/wsl/

NEVER run any flake command from the repository root in WSL.

---

## Allowed commands

### 1. Enter directory

cd ./hosts/wsl

---

### 2. Validate flake

nix flake check --show-trace

---

### 3. Build configuration

nix build .#nixosConfigurations.wsl.config.system.build.toplevel

---

### 4. Apply configuration

sudo nixos-rebuild switch --flake .#wsl

---

## Forbidden actions

* Running nix flake check in repo root
* Running nixos-rebuild outside ./hosts/wsl
* Importing Home Manager modules into NixOS layer
* Mixing system and home modules

---

## Failure handling

If any step fails:

1. STOP immediately
2. DO NOT attempt random fixes
3. Inspect the error
4. Fix the root cause
5. Re-run from step 2

---

## Notes

* WSL uses its own flake entrypoint
* Root flake is NOT valid for WSL testing
* Always treat WSL as a separate deployment target
