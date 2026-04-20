# Conventions

## Nix formatting

- `nix fmt` before every commit — no exceptions
- Indentation: 2 spaces
- Line length: soft limit 100 characters
- Attribute sets: alphabetical order unless order is semantically significant

## Comments

Explain *why*, not *what*. Self-explanatory code needs no comment.
Do not add placeholder comments or scaffolding to files you did not otherwise change.

## Naming

- Module files: `kebab-case.nix`
- NixOS options exposed by modules: follow nixpkgs conventions (`modules.docker.enable`)
- Config files in `config/`: match the application's expected filename exactly

## No complexity tax

If a plain attribute assignment solves the problem, use it.
Do not wrap it in an option, a function, or an abstraction.
Abstractions are justified by reuse or variability, not by aesthetics.
