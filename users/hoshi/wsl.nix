# Home-Manager overrides specific to the WSL host.
# Import order: users/<username>/default.nix → this file.
# Here we disable everything that requires a display /DE, and add WSL-specifics.
{ settings, pkgs, lib, ... }:
{
  # Disable modules that depend on Wayland/X11 if they are in default.nix
  # For example:
  # wayland.WindowManager.niri.enable = lib.mkForce false;
  # services.mako.enable = lib.mkForce false;

  # Forward a variable for convenient work with Windows files
  home.sessionVariables = {
    WINDOWS_HOME = "/mnt/c/Users/$USER"; # path to Windows home folder
  };
}
