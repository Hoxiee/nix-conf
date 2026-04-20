# NVIDIA GPU configuration — RTX 4070 Super on desktop.
# All NVIDIA-specific Wayland environment variables are set here.
# niri.nix must remain unaware of this module.
{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    # Modesetting is required for Wayland. Non-negotiable.
    modesetting.enable = true;

    # The open-source kernel module (not nouveau) — supported on Turing (RTX 20xx) and newer.
    # RTX 4070 Super is Ada Lovelace — fully supported.
    open = true;

    # nvidia-settings GUI — optional but useful.
    nvidiaSettings = true;

    # Stick to the production driver. Switch to beta only if a specific fix is needed.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Power management — reduces resume artifacts on suspend/wake.
    powerManagement.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  # Wayland-specific environment variables for NVIDIA.
  # Without these, niri will either not start or render incorrectly.
  environment.sessionVariables = {
    # Use NVIDIA's GBM backend — required for Wayland on NVIDIA.
    GBM_BACKEND = "nvidia-drm";
    # Force NVIDIA GLX vendor library — prevents Mesa from intercepting.
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Hardware video acceleration via NVDEC.
    LIBVA_DRIVER_NAME = "nvidia";
    # EGL stream backend for hardware cursors.
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
