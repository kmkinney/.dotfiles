{pkgs, ...}: {
  gtk.enable = true;
  gtk.theme = {
    name = "Matcha";
    package = pkgs.matcha-gtk-theme;
  };
}
