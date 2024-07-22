# Which modules to use for the macos system
{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.systems.macos;
in {
  options.systems.macos.enable = mkEnableOption "Enable macos system";
  config = mkIf cfg.enable {
    imports = [
      ../modules/neovim.nix
      ../modules/terminal
      ../modules/git.nix
      ../modules/vscode.nix
    ];

    home.packages = with pkgs; [
      alejandra
      pscale
      ripgrep
      (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})

      nodejs_20
      corepack
    ];
  };
}
