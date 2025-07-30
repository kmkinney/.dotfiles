{
  lib,
  config,
  ...
}: let
  cfg = config.nixos.kevin.gnome;
in {
  options.nixos.kevin.gnome = lib.mkEnabledOption "GNOME Desktop Environment";

  config = lib.mkIf cfg.enable {
    services = {
      xserver.enable = true;
      desktopManager = {
        gnome.enable = true;
      };
      displayManager = {
        gdm.enable = true;
      };
    };
  };
}
