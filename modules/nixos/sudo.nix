# Sudo configuration — enable sudo for wheel group.
{ settings, ... }:
{
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
    extraRules = [
      {
        users = [ "${settings.username}" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
