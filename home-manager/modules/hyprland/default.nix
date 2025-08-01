# This module contains all of the configuration for hyprland and related utilities
# This module requires hyprland module to be installed with nixos
{...}: {
  imports = [
    ./waybar.nix
    ./hyprpaper.nix
    ./hyprland.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];
  # Dotfiles for hyprland and related configs
  home.file.".config/dunst/dunstrc".source = ./dunstrc.cfg;
  home.file.".config/waybar/style.css".source = ./waybar.css;
}
