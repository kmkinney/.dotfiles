# Settings specific to Remi Framework 13 AMD
{pkgs, ...}: {
  # Hardware config
  imports = [
    ../hardware/remi-laptop.nix
  ];
  # Need to set this so that nixos builds the correct config
  networking.hostName = "kevin-remi-framework";

  # Settings to enable / disable optional modules
  nixos.kevin = {
    scripts.enable = true;
    gnome.enable = false;
  };

  # Packages only installed to this system
  # These should probably be modules so think carefully
  environment.systemPackages = with pkgs; [
    slack
  ];
}
