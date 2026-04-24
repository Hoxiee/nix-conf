{ ... }:
{
  imports = [
    ../../modules/home/base.nix

    ../../home/shell
    
    ../../home/desktop/fuzzel.nix
    ../../home/desktop/waybar.nix
    
    ../../home/packages/alacritty.nix
    ../../home/packages/firefox.nix
  ];

  home.username = "hoshi";
  home.homeDirectory = "/home/hoshi";

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  home.packages = with pkgs; [
    #
  ];
}
