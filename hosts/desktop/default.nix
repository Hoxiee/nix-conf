# Desktop host assembly — Ryzen 5 7500F + RTX 4070 Super.
# Only host-specific values live here. Logic belongs in modules.
{ inputs, settings, pkgs, lib, ... }:
{
  imports = [
    ./hardware.nix # generated on machine, not in repo. DO NOT REMOVE.
    ../../modules/nixos/nix.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/niri.nix
    ../../modules/nixos/sddm.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/sudo.nix
    ../../modules/nixos/locale.nix
    ../../modules/nixos/firmware.nix
    ../../modules/nixos/kernel.nix
    
    ../../modules/nixos/gpu/nvidia.nix

    # ../../modules/nixos/features/flatpak.nix
    # ../../modules/nixos/features/docker.nix
  ];

  networking.hostName = "desktop";

  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.fullName;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  system.stateVersion = settings.systemStateVersion;
}
