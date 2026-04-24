{ ... }:
{
  security = {
    # Safe sudo configuration
    sudo = {
      enable = true;
      wheelNeedsPassword = lib.mkDefault true;
    };

    # Real-time audio (PipeWire / JACK)
    rtkit.enable = true;

    # Polkit enabled (needed for GUI)
    polkit.enable = true;

    allowUserNamespaces = true;
  };

  # GNOME auth agent
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "Polkit Authentication Agent";

    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };
}

# { settings, pkgs, ... }:
# {
#   security = {
#     rtkit.enable = true;
#     polkit = {
#       enable = true;
#       extraConfig = ''
#         polkit.addRule(function(action, subject) {
#           if ( subject.isInGroup("users") && (
#             action.id == "org.freedesktop.login1.reboot" ||
#             action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
#             action.id == "org.freedesktop.login1.power-off" ||
#             action.id == "org.freedesktop.login1.power-off-multiple-sessions"
#           ))
#           { return polkit.Result.YES; }
#         })
#       '';
#     };
#   };

#   systemd = {
#     user.services.polkit-gnome-authentication-agent-1 = {
#       description = "polkit-gnome-authentication-agent-1";
#       wantedBy = [ "graphical-session.target" ];
#       wants = [ "graphical-session.target" ];
#       after = [ "graphical-session.target" ];
#       serviceConfig = {
#         Type = "simple";
#         ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
#         Restart = "on-failure";
#         RestartSec = 1;
#         TimeoutStopSec = 10;
#       };
#     };
#   };

#   security.sudo = {
#     enable = true;
#     wheelNeedsPassword = true;
#     extraRules = [
#       {
#         users = [ "${settings.username}" ];
#         commands = [
#           {
#             command = "ALL";
#             options = [ "NOPASSWD" ];
#           }
#         ];
#       }
#     ];
#   };
# }
