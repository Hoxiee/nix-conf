{ inputs, pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri;
  };

  # Required for Wayland desktop functionality
  services.dbus.enable = true;

  # X11 compatibility layer
  programs.xwayland.enable = true;

  # Portals (CRITICAL for file picker, screen share, flatpak)
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
  };
}


# niri Wayland compositor session.
# Configures the full portal stack required for screen sharing,
# file picker, and authentication dialogs to work out of the box.
# { pkgs, ... }:
# {
#   programs.niri = {
#     enable = true;
#     package = pkgs.niri;
#   };

#   xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
#   xdg.portal.enable = true;

#   services.dbus.enable = true;

#   security.polkit.enable = true;

#   environment.sessionVariables = {
#     NIXOS_OZONE_WL = "1";                       # Hint to Electron and Chromium apps to use Wayland natively.
#     GDK_BACKEND = "wayland,x11";                # Force GTK apps to use Wayland.
#     QT_QPA_PLATFORM = "wayland;xcb";            # Force Qt apps to use Wayland.
#     QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
#     SDL_VIDEODRIVER = "wayland";                # SDL2 Wayland backend.
#     CLUTTER_BACKEND = "wayland";                # Clutter Wayland backend.
#   };

#   # Packages required for a functional niri session.
#   environment.systemPackages = with pkgs; [
#     xwayland-satellite # XWayland support for legacy X11 apps
#     wl-clipboard # Wayland clipboard CLI
#     cliphist # Clipboard history
#     swww # Wallpaper daemon
#     wlr-randr # Output management
#     brightnessctl # Brightness control (laptop backlight)
#     playerctl # Media player control
#     libnotify # notify-send
#     swaylock # Screen locker
#     swayidle # Idle daemon
#   ];
# }
