# Waybar status bar.
# Config and style live in config/waybar/ — edit directly without touching Nix.
# Display-specific geometry (width, margins, position) is overridden
# in users/hoshi/laptop.nix and users/hoshi/desktop.nix.
{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  xdg.configFile."waybar/config.jsonc".source = ../../../config/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ../../../config/waybar/style.css;
}
