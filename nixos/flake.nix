{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      kmkinney-nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./nixos/configuration.nix];
      };
    };

    # homeConfigurations = {
    #   "kevin@kmkinney-nixos" = home-manager.lib.homeManagerConfiguration {
    #     inherit pkgs;
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [./home-manager/home.nix];
    #   };
    # };
  };
}
