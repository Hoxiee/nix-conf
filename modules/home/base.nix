# Shared Home Manager configuration applied to all hosts.
# Owns: XDG directories, common session variables, home.stateVersion.
{ settings, ... }:
{
  home.username = settings.username;
  home.homeDirectory = "/home/${settings.username}";

  # Let HM manage itself when used standalone.
  programs.home-manager.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  # Common session variables that belong to the user environment.
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  home.stateVersion = settings.systemStateVersion;
}
