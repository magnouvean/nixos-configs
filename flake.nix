{
  description = "My NixOS configurations";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

  outputs = inputs@ { nixpkgs, home-manager, plasma-manager, ... }: {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem
        {
          system = "x86_64-linux";
          modules = [
            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
              home-manager.users.user1 = import ./home/home.nix;
            }
          ];
        };
      nixos-laptop = nixpkgs.lib.nixosSystem
        {
          system = "x86_64-linux";
          modules = [
            ./hosts/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];
              home-manager.users.user1 = import ./home/home.nix;
            }
          ];
        };
    };
  };
}
