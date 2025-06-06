{
  description = "Kmkinney dotfiles flake";

  # Each output represents a distinct system configuration
  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    inherit (self) outputs;
  in {
    # Nixos
    nixosConfigurations = {
      nixos-pc = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          system = "pc";
        };
        modules = [
          ./nixos/configuration.nix
          # home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      };
      nixos-laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs outputs;
          system = "laptop";
        };
        modules = [
          ./nixos/configuration.nix
          # home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };

  # Specifying flake inputs
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
  };
}
