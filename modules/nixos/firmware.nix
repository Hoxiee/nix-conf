# Firmware configuration — install firmware for hardware support.
{ pkgs, ... }:
{
  # Enable non-free firmware.
  hardware.enableRedistributableFirmware = true;

  # Install firmware packages.
  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware  # Sound Open Firmware for audio
  ];

  # Additional firmware for WiFi and Bluetooth.
  # networking.enableWireless = false; # Use NetworkManager instead
}
