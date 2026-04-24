{ ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 14;
          y = 14;
        };

        decorations = "None";

        opacity = 0.88;
        
        blur = true;
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        size = 13.0;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };

      scrolling = {
        history = 12000;
        multiplier = 3;
      };

      colors = {
        primary = {
          background = "#171A1F";
          foreground = "#E6EAF2";
        };

        normal = {
          black   = "#2B2F36";
          red     = "#F28C8C";
          green   = "#7BD88F";
          yellow  = "#E6D36A";
          blue    = "#6FA8FF";
          magenta = "#C792EA";
          cyan    = "#5FD3C6";
          white   = "#C9D1E3";
        };

        bright = {
          black   = "#3A3F4A";
          red     = "#F28C8C";
          green   = "#7BD88F";
          yellow  = "#E6D36A";
          blue    = "#6FA8FF";
          magenta = "#C792EA";
          cyan    = "#5FD3C6";
          white   = "#F5F7FA";
        };
      };
    };
  };
}