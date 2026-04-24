# Desktop-specific Home Manager overrides.
# Display: 3440x1440 @ 165 Hz, single ultrawide monitor.
# Injected by parts/nixos.nix alongside default.nix — not imported from default.nix.
{ ... }:
{
  # Niri output configuration for the ultrawide.
  # xdg.configFile."niri/config.kdl".source = ../../config/niri/config.kdl;

  # Waybar geometry override for 3440x1440.
  # xdg.configFile."waybar/config.jsonc".source = ../../config/waybar/desktop.jsonc;
}
