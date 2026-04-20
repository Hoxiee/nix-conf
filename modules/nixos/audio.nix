# Audio via PipeWire — replaces PulseAudio and JACK.
{ ... }:
{
  # Disable PulseAudio — PipeWire provides its own compatibility layer.
  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
}
