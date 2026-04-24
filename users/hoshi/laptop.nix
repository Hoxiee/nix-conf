# Laptop-specific Home Manager overrides.
# Display: 2560x1600, fractional scaling.
# Injected by parts/nixos.nix alongside default.nix — not imported from default.nix.
{ ... }:
{
  # Niri output configuration for the built-in display.
  # xdg.configFile."niri/config.kdl".source = ../../config/niri/config.kdl;

  # Waybar geometry override for 2560x1600.
  # If waybar config needs per-host values beyond what CSS handles,
  # source a host-specific file here instead of the shared one.
  # xdg.configFile."waybar/config.jsonc".source = ../../config/waybar/laptop.jsonc;
}
