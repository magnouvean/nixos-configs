{
  description = "NixOS Desktop configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        nixos-desktop1 = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/desktop1/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.magnus = import ./hosts/desktop1/home.nix;
            }
          ];
        };

        nixos-desktop2 = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/desktop2/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.magnus = import ./hosts/desktop2/home.nix;
            }
          ];
        };

        nixos-laptop = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.magnus = import ./hosts/laptop/home.nix;
            }
          ];
        };
      };
    };
}
