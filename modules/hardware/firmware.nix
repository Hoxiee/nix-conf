{ pkgs, ... }:
{
  # Enable non-free firmware.
  hardware.enableRedistributableFirmware = true;

  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware
  ];
}
