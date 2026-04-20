# WSL2 host — Windows Subsystem for Linux.
# No hardware.nix needed: WSL manages the kernel itself.
# GUI-heavy modules (sddm, niri, gpu) are excluded — use a terminal workflow
# or X11/Wayland via WSLg if needed.
{
  inputs,
  settings,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ../../modules/nixos/nix.nix
    ../../modules/nixos/network.nix
  ];

  # Key WSL settings
  wsl.enable = true;
  wsl.defaultUser = settings.username;

  # Enable systemd
  wsl.useWindowsDriver = true; # Forward the Windows GPU driver to WSL (optional)

  # Boot
  boot.isContainer = true;
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = lib.mkForce false;

  networking.hostName = "wsl";

  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.fullName;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  system.stateVersion = settings.systemStateVersion;
}
