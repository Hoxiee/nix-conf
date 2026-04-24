{ lib, pkgs, ... }:
{
  boot = {
    # Loader Configuration
    loader = {
      systemd-boot = {
        enable = lib.mkDefault true;
        configurationLimit = 3;
        # editor = false;
        
        # fix name Windows entry
        extraEntries = {
          "windows.conf" = ''
            title Windows
            efi /EFI/Microsoft/Boot/bootmgfw.efi
          '';
        };
      };
      efi.canTouchEfiVariables = true;
      timeout = lib.mkDefault 3;
    };

    # Kernel Configuration
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

    kernelParams = [
      "quiet"
      "splash"

      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"

      "vt.global_cursor_default=0"

      "transparent_hugepage=madvise"
      "mitigations=auto"
    ]

    kernel.sysctl = {
      "vm.swappiness" = 10;
    }

    plymouth.enable = lib.mkDefault false;  # Boot splash
  }
}
