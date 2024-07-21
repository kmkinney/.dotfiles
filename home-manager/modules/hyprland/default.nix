# This module contains all of the configuration for hyprland and related utilities
# This module requires hyprland module to be installed with nixos
{...}: {
  imports = [./waybar.nix];
  # Dotfiles for hyprland and related configs
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/dunst/dunstrc".source = ./dunstrc.cfg;
  # home.file.".config/waybar/config".source = ./waybar.jsonc;
  home.file.".config/waybar/style.css".source = ./waybar.css;
}
