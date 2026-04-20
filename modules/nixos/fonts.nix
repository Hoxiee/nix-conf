# Fonts configuration — JetBrainsMono Nerd Font for UI and terminal.
{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
    ];

    # Fontconfig settings for better rendering.
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };

      # Enable font hinting.
      hinting = {
        enable = true;
        autohint = true;
      };

      # Enable subpixel rendering.
      subpixel.lcdfilter = "default";
    };
  };
}
