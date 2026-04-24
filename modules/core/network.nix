{ ... }:
{
  networking = {
    networkmanager.enable = true;
    wireless.enable = false; # Disable legacy wireless stack

    # Stateful firewall
    firewall = {
      enable = true;

      # Optional: allow common desktop services if needed
      # allowedTCPPorts = [ 22 ]; # SSH example
      # allowedUDPPorts = [ ];
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    # Enables newer BlueZ features (LE Audio, etc.)
    settings = {
      General.Experimental = true;
    };
  };

  # GUI Bluetooth manager
  # services.blueman.enable = true;
  
  environment.systemPackages = with pkgs; [
    bluetui
  ];
}