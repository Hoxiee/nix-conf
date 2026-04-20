# Alacritty terminal emulator.
# Config lives in config/alacritty.toml — edit directly without touching Nix.
{ ... }:
{
  programs.alacritty.enable = true;

  xdg.configFile."alacritty/alacritty.toml".source = ../../config/alacritty.toml;
}
