{pkgs, ...}: {
  home.username = "kevin";
  home.homeDirectory = "/Users/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    pscale
    ripgrep
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})

    nodejs_20
    corepack
  ];
  programs.home-manager.enable = true;

  imports = [
    ../home-manager/systems/macos.nix
  ];
}
