# Home Manager entry point for hoshi.
# Imports all home modules. Host-specific overrides live in laptop.nix / desktop.nix
# and are injected by parts/nixos.nix — not imported here.
{ ... }:
{
  imports = [
    ../../modules/home/base.nix
    ../../modules/home/zsh.nix
    ../../modules/home/alacritty.nix
    ../../modules/home/firefox.nix
    ../../modules/home/waybar.nix
    ../../modules/home/fuzzel.nix
  ];
}
