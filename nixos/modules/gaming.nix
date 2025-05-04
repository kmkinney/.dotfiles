{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.nixos.kevin.gaming;
in {
  options.nixos.kevin.gaming.enable = lib.mkEnableOption "Gaming programs";
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    programs.gamemode.enable = true;

    hardware.graphics = {
      enable = true;
      #driSupport = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = ["amdgpu"];

    virtualisation.waydroid.enable = true;

    qt = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      mangohud
      protonup
      lutris
      heroic
      discord
      prismlauncher
      fuse
      fuse3
      appimage-run
      jdk17
      mgba
    ];
    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
