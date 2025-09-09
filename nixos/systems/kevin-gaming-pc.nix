# Settings specific to Remi Framework 13 AMD
{pkgs, ...}: {
  # Hardware config
  imports = [
    ../hardware/pc.nix
  ];
  # Need to set this so that nixos builds the correct config
  networking.hostName = "kmkinney-nixos";

  # Settings to enable / disable optional modules
  nixos.kevin = {
    scripts.enable = true;
    gnome.enable = false;
    gaming.enable = true;
  };

  # Packages only installed to this system
  # These should probably be modules so think carefully
  environment.systemPackages = with pkgs; [
    slack
    discord
  ];
}
