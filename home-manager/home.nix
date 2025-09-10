# Linux only for now
{pkgs, ...}: let
in {
  imports = [
    # AGS not working
    # ./modules/ags
    ./modules/chrome.nix
    ./modules/git.nix
    ./modules/gnome.nix
    ./modules/gtk
    ./modules/hyprland
    ./modules/neovim.nix
    ./modules/terminal
  ];

  nixpkgs.config.allowUnfree = true;
  home.username = "kevin";
  home.homeDirectory = "/home/kevin";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  # Standalone packages
  home.packages = with pkgs; [
    alejandra
    ripgrep
    btop
  ];
}
