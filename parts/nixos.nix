{ inputs, ... }:
let
  system = "x86_64-linux";
  
  mkHost = modules:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs;
      };

      modules = modules;
    };
in
{
  flake.nixosConfigurations = {
    desktop = mkHost [
      ../hosts/desktop
      inputs.home-manager.nixosModules.home-manager
      inputs.self.nixosModules.home
      inputs.niri.nixosModules.niri
    ];

    laptop = mkHost [
      ../hosts/laptop
      inputs.home-manager.nixosModules.home-manager
      inputs.self.nixosModules.home
      inputs.niri.nixosModules.niri
    ];
  };
}
