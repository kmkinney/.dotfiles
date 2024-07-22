{pkgs, ...}: {
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  imports = [
    ../home-manager/systems/macos.nix
  ];
}
