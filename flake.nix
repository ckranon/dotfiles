{
  description = "My personal NixOS and Home Manager configurations";

  inputs = {
    # Nixpkgs: the primary source for packages and modules
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager: for managing user-specific configurations (dotfiles)
    home-manager.url = "github:nix-community/home-manager";
    # Ensure home-manager uses the same nixpkgs as the system
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # You can add other inputs here, e.g., custom modules, themes
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Define a NixOS configuration for your VM
    nixosConfigurations."vm.name" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Or aarch64-linux for ARM-based systems
      specialArgs = { inherit inputs; }; # Pass flake inputs to modules
      modules = [
        # Import your VM's system-wide configuration
        ./hosts/your-vm-name/configuration.nix

        # Enable and configure Home Manager for a specific user
        home-manager.nixosModules.home-manager
        {
          home-manager.users.main = import ./hosts/your-vm-name/home.nix;
        }
      ];
    };

    # You can define other nixosConfigurations here for different machines:
    # nixosConfigurations.my-laptop = ...
  };
}
