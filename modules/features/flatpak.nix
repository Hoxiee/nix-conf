# Flatpak support with Flathub remote.
# Apps are installed manually by the user — not managed declaratively.
{ pkgs, ... }:
{
  services.flatpak.enable = true;

  # Add Flathub remote on activation.
  # systemd.services is the correct place — avoids imperative setup post-install.
  systemd.services.flatpak-add-flathub = {
    description = "Add Flathub remote for Flatpak";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
  };
}
