{
  description = "Kmkinney dotfiles flake";

  # These are the inputs for our flake, we can pin specific versions here is we want
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  # Each output represents a distinct system configuration
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  }: let
    inherit (self) outputs;
  in {
    # Nixos configurations
    nixosConfigurations = {
      kevin-remi-framework = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          # Standard modules
          ./nixos/configuration.nix
          ./nixos/systems/kevin-remi-framework.nix

          inputs.stylix.nixosModules.stylix
          nixos-hardware.nixosModules.framework-amd-ai-300-series
        ];
      };
      kmkinney-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
        };
        modules = [
          ./nixos/configuration.nix
          ./nixos/systems/kevin-gaming-pc.nix

          inputs.stylix.nixosModules.stylix
          nixos-hardware.nixosModules.gigabyte-b650
        ];
      };
    };
    # Home manager configurations
    homeConfigurations.kevin = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages."x86_64-linux";

      extraSpecialArgs = {
        inherit inputs;
      };
      modules = [
        ./home.nix
      ];
    };
  };
}
