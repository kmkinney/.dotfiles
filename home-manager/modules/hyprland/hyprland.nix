{
  inputs,
  pkgs,
  ...
}: let
  hyprland-pkgs = inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars;
in {
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [
      hyprland-pkgs.hyprbars
    ];
  };

  # Eventually replace this with nix
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
