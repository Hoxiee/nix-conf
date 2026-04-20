# Network configuration — NetworkManager, bluetooth, firewall.
{ ... }:
{
  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    # Power on bluetooth at boot — convenient for both laptop and desktop.
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  services.blueman.enable = true;

  # Stateful firewall — restrictive by default, open ports as needed per host.
  networking.firewall.enable = true;
}
