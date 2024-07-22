{pkgs, ...}: {
  gtk.enable = true;
  gtk.theme = {
    name = "Matcha-dark-sea";
    package = pkgs.matcha-gtk-theme;
  };
}
