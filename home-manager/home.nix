{
  pkgs,
  system,
  ...
}: let
  systemsModule = {
    "x86_64-linux" = [./systems/linux.nix];
    "aarch64-darwin" = [./systems/macos.nix];
  };
  homeDirectory = {
    "x86_64-linux" = "/home/kevin";
    "aarch64-darwin" = "/Users/kevin";
  };
in {
  nixpkgs.config.allowUnfree = true;
  home.username = "kevin";
  home.homeDirectory = homeDirectory.system;

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  imports = systemsModule.system or [];

  # TODO: figure this out with mkEnable
  # systems.linux.enable = system == "x86_64-linux";
  # systems.linux.enable = false;
  # systems.macos.enable = system == "aarch64-darwin";
  # systems.macos.enable = true;
}
