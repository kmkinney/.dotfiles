{inputs, pkgs, ...}: let
  hyprlandPkgs = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  programs.hyprland = {
    enable = true; 
    # set the flake package
    package = hyprlandPkgs.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage = hyprlandPkgs.xdg-desktop-portal-hyprland;
  };

  # GDM
  services = {
    xserver.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dunst
    grimblast
    hyprpaper
    hyprlock
    hyprpicker
    xdg-desktop-portal-hyprland
    waybar
    wofi
    wl-clipboard
  ];

  # Cached builds, from https://wiki.hypr.land/Nix/Cachix/
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}
