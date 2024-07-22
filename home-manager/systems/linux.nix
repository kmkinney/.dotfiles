# Which modules to use for the linux system
{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.systems.linux;
in {
  options.systems.linux.enable = mkEnableOption "Enable macos system";
  config = mkIf cfg.enable {
    imports = [
      ../modules/git.nix
      ../modules/hyprland
      ../modules/neovim.nix
      ../modules/ranger.nix
      ../modules/terminal
    ];

    # Standalone packages
    home.packages = with pkgs; [
      alejandra
      btop

      nodejs_20
      nodePackages.pnpm
      rust-analyzer
    ];
  };
}
