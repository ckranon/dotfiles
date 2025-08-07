{
  description = "Minimalist NixOS and Home Manager rice";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations."nixos-minimal-rice" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos-minimal-rice/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.users.yourusername = import ./hosts/nixos-minimal-rice/home.nix;
        }
      ];
    };
  };
}
