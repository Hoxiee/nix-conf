{ pkgs, ... }:
{
  programs.home-manager.enable = true;

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs = {
    
  };

  home.stateVersion = "25.11";
}
