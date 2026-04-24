# SDDM display manager with SilentSDDM theme.
# Theme is consumed as a flake input — not vendored into this repo.
{ inputs, pkgs, ... }:
{
  imports = [
    inputs.silent-sddm.nixosModules.default
  ];
  
  programs.silentSDDM = {
      enable = true;
      theme = "default";
      settings.General.scale = 1;
  };

  services.displayManager.defaultSession = "niri";
}
