# Home Manager entry point for hoshi on WSL.
# Imports only modules that work without Wayland/X11.
{ ... }:
{
  imports = [
    ../../modules/home/base.nix
    ../../modules/home/zsh.nix
  ];
}
