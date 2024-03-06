{
  description = "Home Manager configuration of kevin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    macOs = "aarch64-darwin";
    linux = "x86_64-linux";
  in {
    homeConfigurations.macOs = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${macOs};

      # homeDirectory = "/Users/kevin/";
      modules = [./home.nix];
    };

    homeConfigurations.linux = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${linux};

      # homeDirectory = "/home/kevin/";
      modules = [./home.nix];
    };
  };
}
