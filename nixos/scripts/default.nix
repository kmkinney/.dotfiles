{
  pkgs,
  config,
  lib,
  system,
  ...
}: let
  cfg = config.nixos.kevin.scripts;
  importScript = path: import path {inherit pkgs system;};
  scripts = [
    ./nixosbuild.nix
  ];
in {
  options.nixos.kevin.scripts = {
    enable = lib.mkEnableOption "Custom nixos scripts";
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = map importScript scripts;
  };
}
