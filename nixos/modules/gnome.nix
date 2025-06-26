{...}: {
  services = {
    xserver.enable = true;
    desktopManager = {
      gdm.enable = true;
      gnome.enable = true;
    };
  };
}
