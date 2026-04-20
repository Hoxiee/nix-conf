# Firefox browser.
# Profile management via HM — keeps extensions and settings declarative.
{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        # Wayland native rendering.
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        # Smooth scrolling.
        "general.smoothScroll" = true;
        # Disable telemetry.
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
      };
    };
  };
}
