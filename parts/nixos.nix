# nixosConfigurations for all hosts.
# Username is read from settings.nix — the single configuration point.
# Host-specific HM overrides are passed as separate modules alongside the base user module,
# keeping users/hoshi/default.nix free of hostname conditionals.
{ inputs, ... }:
let
  system = "x86_64-linux";

  settings = import ../settings.nix;
  inherit (settings) username;

  # Shared HM configuration applied to all hosts.
  hmBase = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit inputs settings; };
  };
in
{
  flake.nixosConfigurations = {

    laptop = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs settings; };
      modules = [
        ../hosts/laptop/default.nix
        inputs.home-manager.nixosModules.home-manager
        hmBase
        {
          home-manager.users.${username} = {
            imports = [
              ../users/${username}/default.nix
              ../users/${username}/laptop.nix
            ];
          };
        }
      ];
    };

    desktop = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs settings; };
      modules = [
        ../hosts/desktop/default.nix
        inputs.home-manager.nixosModules.home-manager
        hmBase
        {
          home-manager.users.${username} = {
            imports = [
              ../users/${username}/default.nix
              ../users/${username}/desktop.nix
            ];
          };
        }
      ];
    };

  };
}
