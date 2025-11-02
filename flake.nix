{
  description = "NixOS Desktop configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      plasma-manager,
      ...
    }:
    {
      nixosConfigurations = {
        nixos-desktop = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
                plasma-manager.homeModules.plasma-manager
              ];

              home-manager.users.magnus = import ./hosts/desktop/home.nix;
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
              home-manager.sharedModules = [
                plasma-manager.homeModules.plasma-manager
              ];

              home-manager.users.magnus = import ./hosts/laptop/home.nix;
            }
          ];
        };
      };
    };
}
