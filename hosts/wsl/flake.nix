{
  description = "NixOS WSL configuration";

  inputs = {
    # Refers to the main flake
    nixcfg.url = "path:../..";

    nixpkgs.follows = "nixcfg/nixpkgs";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager.follows = "nixcfg/home-manager";
  };

  outputs =
    {
      self,
      nixcfg,
      nixpkgs,
      nixos-wsl,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
      };

      settings = import ../../settings.nix;
      inherit (settings) username;

      hmBase = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inputs = nixcfg.inputs // {
            inherit nixos-wsl;
          };
          inherit settings;
        };
      };
    in
    {
      formatter.${system} = pkgs.nixfmt;

      nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inputs = nixcfg.inputs // {
            inherit nixos-wsl;
          };
          inherit settings;
        };

        modules = [
          nixos-wsl.nixosModules.default
          ./default.nix
          home-manager.nixosModules.home-manager
          hmBase
          {
            home-manager.users.${username}.imports = [
              ../../modules/home/base.nix
              ../../modules/home/zsh.nix
              ../../users/${username}/wsl.nix
            ];
          }
        ];
      };
    };
}
