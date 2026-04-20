# Fuzzel application launcher.
# Config lives in config/fuzzel.ini — edit directly without touching Nix.
{ pkgs, ... }:
{
  home.packages = [ pkgs.fuzzel ];

  xdg.configFile."fuzzel/fuzzel.ini".source = ../../config/fuzzel/fuzzel.ini;
}
