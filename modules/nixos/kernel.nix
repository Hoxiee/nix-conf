# Kernel configuration — optimize for performance and hardware support.
{ pkgs, ... }:
{
  # Use the latest stable kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Kernel parameters for better performance.
  boot.kernelParams = [
    # Improve system responsiveness.
    "mitigations=off"
    # Enable transparent hugepages.
    "transparent_hugepage=always"
    # Improve I/O performance.
    "elevator=mq-deadline"
  ];

  # Kernel modules for hardware support.
  boot.kernelModules = [
    # File systems.
    "vfat"
    "nls_cp437"
    "nls_iso8859-1"
    # USB support.
    "usbhid"
    # Network.
    "r8169"  # Realtek Ethernet
    "r8125"  # Realtek 2.5G Ethernet
  ];

  # Extra kernel modules.
  boot.extraModulePackages = [ ];

  # Blacklist problematic modules.
  boot.blacklistedKernelModules = [
    "snd_hda_intel"  # Use PipeWire instead
  ];

  # Kernel sysctl settings.
  boot.kernel.sysctl = {
    # Improve TCP performance.
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.tcp_congestion_control" = "bbr";
    # Improve file system performance.
    "vm.swappiness" = 10;
  };
}
