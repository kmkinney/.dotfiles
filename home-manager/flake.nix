{
  description = "Home Manager configuration of kevin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    homeConfigurations.linux = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${linux};

      extraSpecialArgs = {
        system = linux;
        inherit inputs;
      };
      modules = [
        ./home.nix
        inputs.ags.homeManagerModules.default
      ];
    };
  };
}
