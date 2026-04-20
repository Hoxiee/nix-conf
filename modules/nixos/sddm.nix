# SDDM display manager with SilentSDDM theme.
# Theme is consumed as a flake input — not vendored into this repo.
{ inputs, pkgs, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "SilentSDDM";
    package = pkgs.kdePackages.sddm;
    extraPackages = [ inputs.silent-sddm.packages.${pkgs.system}.default ];
  };
}
