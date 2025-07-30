{
  pkgs,
  config,
  lib,
  ...
}: let
  # Util function
  importScript = path: import path {inherit pkgs;};

  # Config
  cfg = config.nixos.kevin.scripts;
  scripts = [
    ./nixosbuild.nix
    ./ssh.nix
    ./home-manager.nix
  ];
in {
  options.nixos.kevin.scripts = {
    enable = lib.mkEnableOption "Custom nixos scripts";
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = map importScript scripts;
  };
}
