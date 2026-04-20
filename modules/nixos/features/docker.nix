# Docker — opt-in per host via modules.docker.enable.
# Default mode: rootless. Safer for multi-user deployments.
{ config, lib, settings, ... }:
{
  options.modules.docker = {
    enable = lib.mkEnableOption "Docker";
    rootless = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Run Docker in rootless mode (recommended).";
    };
  };

  config = lib.mkIf config.modules.docker.enable {
    virtualisation.docker = {
      enable = true;
      rootless = lib.mkIf config.modules.docker.rootless {
        enable = true;
        setSocketVariable = true;
      };
    };

    # Add user to docker group only in rootful mode.
    # In rootless mode the socket belongs to the user already.
    users.users.${settings.username}.extraGroups = lib.mkIf (!config.modules.docker.rootless) [
      "docker"
    ];
  };
}
