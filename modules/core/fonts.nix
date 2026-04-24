{ pkgs, lib, ... }:
{
  fonts = {
    # Disable implicit font set to keep full control
    enableDefaultPackages = false;

    fontconfig = {
      enable = true;
      antialias = true;

      hinting = {
        enable = true;
        style = "slight";
      };

      subpixel.rgba = "none"; # use "none" for Wayland + HiDPI sometimes

      defaultFonts = {
        serif = [ "Noto Serif" "Liberation Serif" ];
        sansSerif = [ "Noto Sans" "Liberation Sans" ];
        monospace = [ "JetBrains Mono" "Fira Code" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };

    packages = with pkgs; [
      # Core font families
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf

      # Development fonts
      jetbrains-mono
      fira-code

      # Minimal UI additions (optional)
      roboto

      # Icons
      nerd-fonts.jetbrains-mono
    ];
  };
}