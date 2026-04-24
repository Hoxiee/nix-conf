{ pkgs, lib, ... }:
{
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    wireplumber.enable = true;

    # Optional: enable JACK compatibility if needed for pro audio
    # jack.enable = true;

    # Low-latency tuning (safe-ish defaults)
    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock.rate = 48000;

        # Balanced latency for BT + desktop usage
        default.clock.quantum = 128;
        default.clock.min-quantum = 64;
        default.clock.max-quantum = 2048;
      };
    };

    wireplumber.extraConfig."bluetooth.lua.d/51-bluez-config" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;

        # Enable multiple codecs, auto-select best
        "bluez5.codecs" = [ "sbc" "aac" "ldac" ];
      };
    };
  };

  # Optional tools for debugging / control
  environment.systemPackages = with pkgs; [
    pavucontrol   # PulseAudio-style volume control
    helvum        # PipeWire patchbay (graph view)
    easyeffects   # Audio effects (EQ, limiter, etc.)
  ];
}