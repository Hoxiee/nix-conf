{ inputs, pkgs, ... }:
let
  username = "hoshi";
in
{
  imports = [
    ./hardware.nix # Generated on machine. DO NOT REMOVE
    
    # Common modules
    ../../modules/core
    ../../modules/desktop
    
    # Hardware section
    ../../modules/hardware/firmware.nix
    ../../modules/hardware/gpu/nvidia.nix

    # Feature section
    ../../modules/nixos/features/flatpak.nix
    ../../modules/nixos/features/docker.nix

    # Home Manager
    ../../home/common.nix
  ];

  networking.hostName = "desktop";

  users.users.${username} = {
    isNormalUser = true;
    description = ${username};
    extraGroups = [ "wheel" "networkmanager" "video" "audio" "input" ];
    shell = pkgs.zsh;
  };

  home-manager.users.${username} = {
    useGlobalPkgs = true;
    useUserPackages = true;

    imports = [
      ../../users/${username}
    ];

    
  };

  programs.zsh.enable = true;

  # Kernel configuration (optional)
  # kernelPackages = pkgs.linuxPackages_latest;

  system = {
    # Windows 11's forced auto-updates that cannot be disabled
    autoUpgrade = {
      enable = true;
      allowReboot = false;
      dates = "weekly";
    };
    stateVersion = "25.11";
  };
}

