{pkgs, ...}: {
  programs.steam = {
    enable = true;
    gamescopeSession = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  programs.gamemode.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["amdgpu"];

  environment.systemPackages = with pkgs; [
    mangohud
    protonup
  ];
}
