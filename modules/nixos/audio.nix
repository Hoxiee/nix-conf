# Audio via PipeWire — replaces PulseAudio and JACK.
{ pkgs, lib, ... }:
{
  # Disable PulseAudio — PipeWire provides its own compatibility layer.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
    wireplumber.enable = true;

    # Low latency configuration.
    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate = 48000;
        default.clock.quantum = 32;
        default.clock.min-quantum = 32;
        default.clock.max-quantum = 8192;
      };
    };
  };

  # Audio tools.
  # environment.systemPackages = with pkgs; [
  #   pavucontrol
  #   helvum
  #   easyeffects
  # ];
}
