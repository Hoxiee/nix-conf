# niri Wayland compositor session.
# Configures the full portal stack required for screen sharing,
# file picker, and authentication dialogs to work out of the box.
{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # XDG desktop portals — required for Wayland app integration.
  xdg.portal = {
    enable = true;
    # xdg-desktop-portal-gnome covers file picker and most portal interfaces.
    # xdg-desktop-portal-wlr covers screen sharing for wlroots-based compositors.
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
    ];
    # Route portal requests explicitly — avoids ambiguity when multiple portals are present.
    config.niri = {
      default = [ "gnome" "wlr" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
    };
  };

  # D-Bus is required for portals and most Wayland desktop integration.
  services.dbus.enable = true;

  # Polkit agent — needed for privilege escalation dialogs in a WM session.
  security.polkit.enable = true;

  # Session variables propagated to the systemd user environment.
  # GPU-specific variables (GBM_BACKEND, __GLX_VENDOR_LIBRARY_NAME, etc.)
  # are set in gpu/nvidia.nix — not here.
  environment.sessionVariables = {
    # Hint to Electron and Chromium apps to use Wayland natively.
    NIXOS_OZONE_WL = "1";
    # Force GTK apps to use Wayland.
    GDK_BACKEND = "wayland,x11";
    # Force Qt apps to use Wayland.
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    # SDL2 Wayland backend.
    SDL_VIDEODRIVER = "wayland";
    # Clutter Wayland backend.
    CLUTTER_BACKEND = "wayland";
  };

  # Packages required for a functional niri session.
  environment.systemPackages = with pkgs; [
    xwayland-satellite   # XWayland support for legacy X11 apps
    wl-clipboard         # Wayland clipboard CLI
    cliphist             # Clipboard history
    swww                 # Wallpaper daemon
    wlr-randr            # Output management
    brightnessctl        # Brightness control (laptop backlight)
    playerctl            # Media player control
    libnotify            # notify-send
    swaylock             # Screen locker
    swayidle             # Idle daemon
  ];
}
