{
  pkgs,
  system,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.username = "kevin";
  home.homeDirectory =
    if system == "x86_64-linux"
    then "/home/kevin"
    else "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  imports = [
    ./systems/macos.nix
    ./systems/linux.nix
  ];

  services.linux.enable = system == "x86_64-linux";
  services.macos.enable = system == "aarch64-darwin";
}
